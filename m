Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED16C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 07:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2DE10E4DB;
	Tue, 17 Jun 2025 07:24:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D6E10E132;
 Tue, 17 Jun 2025 07:24:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5181898255307323777=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_lib/i915=3A_Avoid_non-cano?=
 =?utf-8?q?nical_address_dereference_in_gem=5Fhas=5Frelocations=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jun 2025 07:24:39 -0000
Message-ID: <175014507940.85898.3520963783848064264@1538d3639d33>
X-Patchwork-Hint: ignore
References: <j6ll6li2qmkk3gwamz36s4saf3ehp6qutkxl3cc2sbm2i2ujsq@5xel3p4b5cw6>
In-Reply-To: <j6ll6li2qmkk3gwamz36s4saf3ehp6qutkxl3cc2sbm2i2ujsq@5xel3p4b5cw6>
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

--===============5181898255307323777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915: Avoid non-canonical address dereference in gem_has_relocations()
URL   : https://patchwork.freedesktop.org/series/150332/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8412_FULL -> XEIGTPW_13304_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Known issues
------------

  Here are the changes found in XEIGTPW_13304_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][1] ([Intel XE#911]) +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#3767]) +15 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#3658])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +6 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124]) +8 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#2191])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2314] / [Intel XE#2894])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2191])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#367]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1512])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2907]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2669] / [Intel XE#3433]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#3432])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2669]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23] ([Intel XE#2705] / [Intel XE#4212])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#4212])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2652] / [Intel XE#787]) +16 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#787]) +104 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2887]) +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2325])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#306]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2252]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#373]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#373]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][35] ([Intel XE#1178]) +3 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][36] ([Intel XE#1178]) +2 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#5176]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#3304])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2320]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1424]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#308]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#2321]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2321]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2291]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#2291]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#4354])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#4331])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#4331])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2244]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-7/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#2244])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#776])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1138])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1138])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1135])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1421]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2316])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2316]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [TIMEOUT][60] ([Intel XE#1504]) +1 other test timeout
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [PASS][61] -> [FAIL][62] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][63] -> [INCOMPLETE][64] ([Intel XE#2049] / [Intel XE#2597])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][65] -> [FAIL][66] ([Intel XE#2882]) +2 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-3/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1401]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2312]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#651]) +26 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2311]) +14 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#4141]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#656]) +23 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#651]) +7 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#653]) +23 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2313]) +16 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2502])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#605])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#605])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-5/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#4298])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#4298])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_joiner@basic-max-non-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#4298])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#356])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2486])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][87] ([Intel XE#616]) +2 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#4596])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#309]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#2763]) +15 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2763]) +9 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#870]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][94] ([Intel XE#718])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2499])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1439] / [Intel XE#3141])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#2893] / [Intel XE#4608])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#4608]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1489]) +8 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#2893]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1489]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1122]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#4609]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1406]) +6 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#3414]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-5/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1127])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2413])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1435])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#1499])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#455]) +9 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_vrr@flip-dpms.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1123]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1126])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2504])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#4837]) +13 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#4837]) +8 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#4837]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-4/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#4518])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#4518])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#4518])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#688]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1392]) +5 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][127] ([Intel XE#4842])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2322]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#288]) +21 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#4943]) +13 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#4943]) +15 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@process-many-mmap-huge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4915]) +201 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@xe_exec_system_allocator@process-many-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][133] -> [FAIL][134] ([Intel XE#5018])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1416])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-6/igt@xe_mmap@vram.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#4501])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@xe_oa@buffer-size.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2427])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@xe_peer2peer@write.html
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1061])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-7/igt@xe_peer2peer@write.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][141] ([Intel XE#1173]) +1 other test fail
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#584]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][143] -> [ABORT][144] ([Intel XE#1794])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#4733])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#4733]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#944])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#944]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#944]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#4814])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#3342])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-6/igt@xe_sriov_flr@flr-each-isolation.html
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#3342])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#4351])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#4351])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][157] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][159] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][161] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][163] ([Intel XE#2291]) -> [PASS][164] +2 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][165] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][167] ([Intel XE#2316]) -> [PASS][168] +12 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [FAIL][169] ([Intel XE#301]) -> [PASS][170] +7 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][171] ([Intel XE#1503]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [INCOMPLETE][173] -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-466/igt@kms_plane_cursor@overlay.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][175] ([Intel XE#616]) -> [PASS][176] +2 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#4208] / [i915#2575]) -> [PASS][178] +13 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][179] ([Intel XE#1435]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][181] ([Intel XE#1499]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-8/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1392]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_queue_property@invalid-property:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#4208]) -> [PASS][186] +34 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_exec_queue_property@invalid-property.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@xe_exec_queue_property@invalid-property.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][187] ([Intel XE#4819]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-435/igt@xe_pmu@gt-frequency.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#4208]) -> [SKIP][190] ([Intel XE#316])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#4208]) -> [SKIP][192] ([Intel XE#1124])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#4208] / [i915#2575]) -> [SKIP][194] ([Intel XE#2191])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#4208] / [i915#2575]) -> [SKIP][196] ([Intel XE#367])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#4208]) -> [SKIP][198] ([Intel XE#3442])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#4208]) -> [SKIP][200] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][201] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][202] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#4208] / [i915#2575]) -> [SKIP][204] ([Intel XE#373])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][205] ([Intel XE#1178]) -> [SKIP][206] ([Intel XE#2341])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#4208] / [i915#2575]) -> [SKIP][208] ([Intel XE#308])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#4208] / [i915#2575]) -> [SKIP][210] ([Intel XE#1138])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_feature_discovery@display-4x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][211] ([Intel XE#2311]) -> [SKIP][212] ([Intel XE#2312]) +13 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][213] ([Intel XE#2312]) -> [SKIP][214] ([Intel XE#2311]) +21 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][215] ([Intel XE#4141]) -> [SKIP][216] ([Intel XE#2312]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][217] ([Intel XE#2312]) -> [SKIP][218] ([Intel XE#4141]) +13 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#4208]) -> [SKIP][220] ([Intel XE#651]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][222] ([Intel XE#651])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][223] ([Intel XE#2312]) -> [SKIP][224] ([Intel XE#2313]) +19 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#4208]) -> [SKIP][226] ([Intel XE#653]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][227] ([Intel XE#2313]) -> [SKIP][228] ([Intel XE#2312]) +16 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][230] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#4208]) -> [SKIP][232] ([Intel XE#2850] / [Intel XE#929])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#4208] / [i915#2575]) -> [SKIP][234] ([Intel XE#3414])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#4208] / [i915#2575]) -> [SKIP][236] ([Intel XE#455]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][237] ([Intel XE#2426]) -> [SKIP][238] ([Intel XE#2509])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#4208]) -> [SKIP][240] ([Intel XE#4497])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_eu_stall@blocking-read.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug_online@single-step:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#4208]) -> [SKIP][242] ([Intel XE#4837]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_eudebug_online@single-step.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#4208]) -> [SKIP][244] ([Intel XE#288]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#4208]) -> [SKIP][246] ([Intel XE#4915]) +48 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#4208]) -> [SKIP][248] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_oa@buffer-fill.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@xe_oa@buffer-fill.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#4208]) -> [SKIP][250] ([Intel XE#4821])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8412/shard-dg2-463/igt@xe_spin_batch@spin-mem-copy.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@xe_spin_batch@spin-mem-copy.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5176]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5176
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8412 -> IGTPW_13304
  * Linux: xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76 -> xe-3257-e5ea2eb854715117548883dd2362389dcfcd5180

  IGTPW_13304: 13304
  IGT_8412: 8412
  xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76: dea7240e83c9e58ec755a3d68e7db10068df6b76
  xe-3257-e5ea2eb854715117548883dd2362389dcfcd5180: e5ea2eb854715117548883dd2362389dcfcd5180

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/index.html

--===============5181898255307323777==
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
<tr><td><b>Series:</b></td><td>lib/i915: Avoid non-canonical address derefe=
rence in gem_has_relocations()</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/150332/">https://patchwork.freedesktop.org/series/150332/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13304/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13304/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8412_FULL -&gt; XEIGTPW_13304_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13304_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@kms_async_flips@async-flip-with-=
page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a=
-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel=
 XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_bw@connected-linear-tiling=
-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_bw@linear-tiling-1-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13304/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-a-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13304/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg=
2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel =
XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +16 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tile=
d-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +104 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_chamelium_color@gamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-stres=
s-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-no=
nplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-3/igt@kms_content_protection@atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_content_protection@lic-typ=
e-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-4/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5176">Intel XE#5176</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-fli=
pb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_dp_linktrain_fallback@dsc-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-7/igt@kms_dsc@dsc-with-bpc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
4">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@kms_fbcon_fbt@psr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Int=
el XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_feature_discovery@psr2.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-5/igt@kms_flip@2x-blocking-absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1421">Intel XE#1421</a>) +5 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/ig=
t@kms_flip@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-4/igt@kms_flip@bo-too-big-interruptibl=
e@a-edp1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_133=
04/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-=
a6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13304/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@c-hd=
mi-a6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-3/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdm=
i-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13304/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@=
a-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p=
-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rg=
b101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +23 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
502">Intel XE#2502</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/605">Intel XE#605</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-5/igt@kms_getfb@getfb-reject-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
05">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@kms_joiner@basic-max-non-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4298">Intel XE#4298</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4298">Intel XE#4298</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_multipipe_modeset@basic-ma=
x-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-=
bmg-5/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-5/igt@kms_plane_scaling@2x-scaler-mult=
i-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_pm_backlight@fade.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"=
>Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Inte=
l XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">I=
ntel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render@e=
dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4609">Intel XE#4609</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-for=
mat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-5/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@kms_setmode@invalid-clone-single=
-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-3/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_vrr@flip-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@xe_compute_preempt@compute-pre=
empt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-=
0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0=
x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@xe_create@multigpu-create-massiv=
e-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufenc=
e-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4837">Intel XE#4837</a>) +13 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-4/igt@xe_eudebug_online@single-step.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-2/igt@xe_eudebug_sriov@deny-sriov.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4518">Intel XE#4518</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@xe_eudebug_sriov@deny-sriov.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@xe_eudebug_sriov@deny-sriov.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-si=
mple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-4/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec=
-null-defer-bind.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null=
-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@xe_exec_fault_mode@twice-inval=
id-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@xe_exec_system_allocator@once-la=
rge-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +13 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@xe_exec_system_allocator@process=
-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +15 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@xe_exec_system_allocator@proce=
ss-many-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +201 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-3/igt@xe_exec_sys=
tem_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-6/igt@xe_mmap@vram.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#=
1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@xe_oa@buffer-size.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">In=
tel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@xe_oa@polling-small-buf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@xe_oa@syncs-userptr-wait-cfg.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-7/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Int=
el XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-=
vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-1/igt@xe_pm@s3-vm-bind-unbind-all.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
584">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-lnl-2/i=
gt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-te=
rmination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@xe_pxp@pxp-stale-bo-exec-post-=
termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@xe_query@multigpu-query-mem-us=
age.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@xe_render_copy@render-stress-0=
-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-6/igt@xe_sriov_flr@flr-each-isolation.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3342">Intel XE#3342</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-lnl-8/igt@xe_sriov_scheduling@equal-throug=
hput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt=
-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/235=
1">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb-=
size-overflow.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-2/igt@kms_bw@connecte=
d-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-d=
g2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Inte=
l XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13304/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-8/igt@kms_cursor_lega=
cy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +2 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@km=
s_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#23=
16</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
304/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +12 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13304/shard-dg2-434/igt@kms_flip@flip-vs-expired-vbl=
ank-interruptible@d-dp4.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/s=
hard-bmg-5/igt@kms_hdr@static-toggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-466/igt@kms_plane_cursor@overlay.html">INCOMPLETE</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shar=
d-dg2-436/igt@kms_plane_cursor@overlay.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-=
64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a=
-hdmi-a-6-size-64.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-w=
ith-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_=
plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">PASS</a> +13 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13304/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1330=
4/shard-bmg-8/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13304/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic=
-defer-mmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@invalid-property:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_exec_queue_property@invalid-property.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13304/shard-dg2-435/igt@xe_exec_queue_property@invalid-propert=
y.html">PASS</a> +34 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-435/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819">Intel XE#4819</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/s=
hard-dg2-463/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13304/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">I=
ntel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@kms_bw@conn=
ected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2560x1440p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-464/igt@kms_bw@linear-tiling-=
4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard=
-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_chamelium_e=
did@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13304/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">In=
tel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_cursor_crc@cursor-ons=
creen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_feature_discovery@display-4x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13304/shard-dg2-433/igt@kms_feature_discovery@display-4=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-8/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-5/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-c=
ur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_frontbu=
ffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-434/igt@km=
s_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-8/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13304/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13304/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Inte=
l XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13304/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414=
">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-466/igt@kms_scaling_modes@sca=
ling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13304/shard-bmg-1/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3304/shard-dg2-433/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_eudebug_online@single-step.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13304/shard-dg2-433/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE=
#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-=
prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-434/igt@xe_exec_fault_mode@twic=
e-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_exec_system_allocator@process-many-execqueu=
es-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/shard-dg2-436/igt@xe_exec_sy=
stem_allocator@process-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel X=
E#4915</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13304/sha=
rd-dg2-433/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8412/shard-dg2-463/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13304/shard-dg2-466/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821">Intel XE#482=
1</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8412 -&gt; IGTPW_13304</li>
<li>Linux: xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76 -&gt; xe-3257-e=
5ea2eb854715117548883dd2362389dcfcd5180</li>
</ul>
<p>IGTPW_13304: 13304<br />
  IGT_8412: 8412<br />
  xe-3255-dea7240e83c9e58ec755a3d68e7db10068df6b76: dea7240e83c9e58ec755a3d=
68e7db10068df6b76<br />
  xe-3257-e5ea2eb854715117548883dd2362389dcfcd5180: e5ea2eb854715117548883d=
d2362389dcfcd5180</p>

</body>
</html>

--===============5181898255307323777==--
