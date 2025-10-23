Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693BECCD193
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 05:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198C110E879;
	Thu, 23 Oct 2025 05:59:49 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA4910E00E;
 Thu, 23 Oct 2025 05:59:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3099806250489106051=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_tests/intel/xe=5Ffault=5Fi?=
 =?utf-8?q?njection=3A_Force_clear_injection_list_on_task_end?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 Oct 2025 05:59:48 -0000
Message-ID: <176119918842.45220.12257034102699667652@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251022211147.27810-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251022211147.27810-2-jonathan.cavitt@intel.com>
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

--===============3099806250489106051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Force clear injection list on task end
URL   : https://patchwork.freedesktop.org/series/156377/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8595_FULL -> XEIGTPW_13931_FULL
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

  Here are the changes found in XEIGTPW_13931_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#5993]) +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#664])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-7/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1407]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#607])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#607])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1124]) +10 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#2191])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#367])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#367]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2669]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#787]) +62 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3432])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +12 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][22] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][23] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][24] ([Intel XE#2705] / [Intel XE#4212])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#373]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-4/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#373]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2390])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     NOTRUN -> [FAIL][29] ([Intel XE#1178]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2341])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][31] ([Intel XE#1188]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-436/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2320]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#308])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1424])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2291]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#309]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2291])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][39] -> [FAIL][40] ([Intel XE#4633])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#4302])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4354])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#5425])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#701])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#701])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2316]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1421])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#301])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][50] ([Intel XE#301]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#301] / [Intel XE#3321])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#455]) +13 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1401]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2293]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2311]) +19 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#651]) +16 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#656]) +11 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#5427])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#5390]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#6312])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#651]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2312])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2313]) +18 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#6312]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#653]) +15 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1470])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-4/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1470] / [Intel XE#2853])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#1503])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-4/igt@kms_hdr@static-swap.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2934])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2925])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#4329])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#599]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#718])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1406]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#3414]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1127])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#3414] / [Intel XE#3904])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#1435])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#362])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#330])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2450])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1499]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_vrr@flip-suspend.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#6360])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x8fffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#5300])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x8fffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1126])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#5626]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#4837]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#4837]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#4837]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#688]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-4/igt@xe_evict@evict-threads-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2322]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1392]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#288]) +11 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-madvise:
    - shard-lnl:          NOTRUN -> [WARN][105] ([Intel XE#5786])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-2/igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-madvise.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          NOTRUN -> [WARN][106] ([Intel XE#5786])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#4943]) +6 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-2/igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#4943]) +13 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#4915]) +216 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [PASS][110] -> [DMESG-WARN][111] ([Intel XE#5893])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - shard-dg2-set2:     [PASS][112] -> [FAIL][113] ([Intel XE#6407])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-dg2-435/igt@xe_gt_freq@freq_fixed_idle.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-434/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#5100])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-8/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#3573]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#977])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2284]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][119] ([Intel XE#6227])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][120] -> [FAIL][121] ([Intel XE#6406])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-lnl-5/igt@xe_pm@s4-basic-exec.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [FAIL][122] ([Intel XE#6406])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html
    - shard-bmg:          NOTRUN -> [FAIL][123] ([Intel XE#6406])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#4733]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#4733]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#944]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#944]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#944])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-4/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#4814])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-433/igt@xe_render_copy@render-stress-2-copies.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][130] -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-dg2-435/igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-4.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#3862]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][134] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][136] ([Intel XE#2291]) -> [PASS][137] +2 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][138] ([Intel XE#2316]) -> [PASS][139] +5 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][140] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][141] +3 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][142] ([Intel XE#1503]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-4/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][144] ([Intel XE#4596]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][146] ([Intel XE#718]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][148] ([i915#15106]) -> [PASS][149] +2 other tests pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [FAIL][150] ([Intel XE#6406]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-3/igt@xe_pm@s4-vm-bind-unbind-all.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-2/igt@xe_pm@s4-vm-bind-unbind-all.html
    - shard-lnl:          [FAIL][152] ([Intel XE#6406]) -> [PASS][153] +2 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-bmg:          [FAIL][154] ([Intel XE#5937]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][156] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][157] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][158] ([Intel XE#1178]) -> [SKIP][159] ([Intel XE#2341])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-4/igt@kms_content_protection@legacy.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][160] ([Intel XE#5390]) -> [SKIP][161] ([Intel XE#2312]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][162] ([Intel XE#2312]) -> [SKIP][163] ([Intel XE#5390]) +6 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][164] ([Intel XE#2311]) -> [SKIP][165] ([Intel XE#2312]) +13 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][166] ([Intel XE#2312]) -> [SKIP][167] ([Intel XE#2311]) +10 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][168] ([Intel XE#2313]) -> [SKIP][169] ([Intel XE#2312]) +9 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][170] ([Intel XE#2312]) -> [SKIP][171] ([Intel XE#2313]) +7 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][172] ([Intel XE#5021]) -> [SKIP][173] ([Intel XE#4596])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][174] ([Intel XE#2426]) -> [FAIL][175] ([Intel XE#1729])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6227
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#6406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6406
  [Intel XE#6407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6407
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106


Build changes
-------------

  * IGT: IGT_8595 -> IGTPW_13931

  IGTPW_13931: 290245aa5d558481bb8c2fde7a525121c9ca3f96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8595: 8595
  xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd: 71929a54e8bb5da291d41a931d80c6c9160073dd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/index.html

--===============3099806250489106051==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Force clear =
injection list on task end</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/156377/">https://patchwork.freedesktop.org/series/156377/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13931/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13931/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8595_FULL -&gt; XEIGTPW_13931_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13931_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13931/shard-lnl-1/igt@kms_async_flips@async-flip-=
with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) +3 o=
ther tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-7/igt@kms_async_flips@test-cursor-atom=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-=
offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@kms_bw@linear-tiling-4-display=
s-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-=
bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-ti=
led-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-til=
ed-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel =
XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-4/igt@kms_chamelium_hpd@dp-hpd-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm=
-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-wit=
h-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-3/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@kms_content_protection@legacy.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-436/igt@kms_content_protection@uevent.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-mo=
vement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-move=
ment-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3931/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-fli=
pb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_139=
31/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel =
XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/54=
25">Intel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-433/igt@kms_feature_discovery@chameliu=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/701">Intel XE#701</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13931/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-1/igt@kms_flip@2x-single-buffer-flip-v=
s-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblan=
k.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@=
b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblan=
k@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp=
-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests=
 skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-=
rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5427">Intel XE#5427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shr=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5390">Intel XE#5390</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1=
p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-4/igt@kms_hdmi_inject@inject-4k.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
70">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1470">Intel XE#1470</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-4/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@k=
ms_hdr@static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2934">Intel XE#2934</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@kms_joiner@basic-force-ultra-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@kms_plane_lowres@tiling-x@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-7/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@kms_psr@pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@kms_psr@psr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-4/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@kms_rotation_crc@primary-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13931/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-8/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@kms_tv_load_detect@load-detect=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/330">Intel XE#330</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-433/igt@xe_compute_preempt@compute-pre=
empt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6360">Intel XE#6360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x8fffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-=
0x8fffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5300">Intel XE#5300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@xe_eu_stall@blocking-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5626">Intel XE#5626</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-5/igt@xe_eudebug@discovery-empty-clien=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-464/igt@xe_eudebug@multiple-sessions.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-5/igt@xe_eudebug_online@single-step-on=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-4/igt@xe_evict@evict-threads-large-mul=
ti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-8/igt@xe_exec_basic@multigpu-once-user=
ptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@xe_exec_fault_mode@many-userpt=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch-madvi=
se:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-2/igt@xe_exec_system_allocator@many-la=
rge-execqueues-malloc-prefetch-madvise.html">WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@xe_exec_system_allocator@many-st=
ride-malloc-prefetch.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-2/igt@xe_exec_system_allocator@many-st=
ride-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-5/igt@xe_exec_system_allocator@threads=
-many-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4943">Intel XE#4943</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@xe_exec_system_allocator@threa=
ds-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +216 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function=
-xe_wopcm_init.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@xe_fault_injection@inject-fault=
-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5893">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-dg2-435/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-dg=
2-434/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6407">Intel XE#6407</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-8/igt@xe_mmap@pci-membarrier-parallel.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream=
-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">=
Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6227">Intel XE#6227</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-lnl-5/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-lnl-3/igt@x=
e_pm@s4-basic-exec.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6406">Intel XE#6406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
406">Intel XE#6406</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-2/igt@xe_pm@s4-vm-bind-userptr.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/640=
6">Intel XE#6406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@xe_pxp@pxp-termination-key-updat=
e-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-466/igt@xe_pxp@pxp-termination-key-upd=
ate-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-bmg-8/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@xe_query@multigpu-query-mem-us=
age.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-lnl-4/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13931/shard-dg2-433/igt@xe_render_copy@render-stress-2=
-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-dg2-435/igt@kms_atomic_transition@plane-all-transition@pip=
e-a-dp-4.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@kms_atomic_transition@plane-all=
-transition@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3862">Intel XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13931/shard-dg2-432/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-dg2-mc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/sha=
rd-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13931/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-leg=
acy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#23=
16</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
931/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +5 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-3/igt@kms_flip@flip-vs-suspen=
d-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/s=
hard-bmg-4/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13931/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-l=
nl-7/igt@kms_pm_dc@dc6-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i9=
15#15106</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13931/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-3/igt@xe_pm@s4-vm-bind-unbind-all.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6406">Intel XE#6=
406</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3931/shard-bmg-2/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6406">Intel XE#6=
406</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3931/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> +2 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5937">Intel XE#5937</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13931/shard-bmg-8/igt@xe_sriov_scheduling@nonpreempt-engine=
-resets.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard=
-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-4/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13931/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-7/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13931/shard-bmg-8/igt@kms_frontbuffer_tracking@=
psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel =
XE#5021</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13931/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE=
#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8595/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13931/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729=
">Intel XE#1729</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8595 -&gt; IGTPW_13931</li>
</ul>
<p>IGTPW_13931: 290245aa5d558481bb8c2fde7a525121c9ca3f96 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8595: 8595<br />
  xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd: 71929a54e8bb5da291d41a9=
31d80c6c9160073dd</p>

</body>
</html>

--===============3099806250489106051==--
