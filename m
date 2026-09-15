Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394F4C88E72
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 01:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA55D10E16D;
	Tue, 15 Sep 2026 01:22:45 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B6610E16D;
 Tue, 15 Sep 2026 01:22:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6925273111602233404=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/kms=5Fcolor=3A_Add_s?=
 =?utf-8?q?upport_for_background_color_testing=2E_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 15 Sep 2026 01:22:04 -0000
Message-ID: <178943532412.162013.15126848923430135386@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260914094415.10899-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260914094415.10899-1-kamil.konieczny@linux.intel.com>
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

--===============6925273111602233404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: Add support for background color testing. (rev4)
URL   : https://patchwork.freedesktop.org/series/167119/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9094_FULL -> XEIGTPW_15840_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15840_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15840_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15840_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic@crtc-invalid-params:
    - shard-bmg:          NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_atomic@crtc-invalid-params.html

  * igt@kms_atomic@plane-invalid-params:
    - shard-bmg:          [PASS][2] -> [FAIL][3] +11 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-bmg-1/igt@kms_atomic@plane-invalid-params.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_atomic@plane-invalid-params.html

  * igt@kms_atomic@plane-overlay-legacy@pipe-a-edp-1:
    - shard-lnl:          [PASS][4] -> [FAIL][5] +13 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-2/igt@kms_atomic@plane-overlay-legacy@pipe-a-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_atomic@plane-overlay-legacy@pipe-a-edp-1.html

  
New tests
---------

  New tests have been introduced between XEIGT_9094_FULL and XEIGTPW_15840_FULL:

### New IGT tests (5) ###

  * igt@kms_color@background-color:
    - Statuses : 2 pass(s)
    - Exec time: [5.83, 7.80] s

  * igt@kms_color@background-color@pipe-a-background-color:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.90] s

  * igt@kms_color@background-color@pipe-b-background-color:
    - Statuses : 2 pass(s)
    - Exec time: [1.94, 2.19] s

  * igt@kms_color@background-color@pipe-c-background-color:
    - Statuses : 2 pass(s)
    - Exec time: [1.99, 2.22] s

  * igt@kms_color@background-color@pipe-d-background-color:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15840_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][6] -> [ABORT][7] ([Intel XE#8007])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-bmg-10/igt@core_hotunplug@hotrebind-lateclose.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2233])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic@atomic-plane-damage:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][9] ([Intel XE#8479])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_atomic@atomic-plane-damage.html

  * igt@kms_atomic@test-only:
    - shard-bmg:          [PASS][10] -> [INCOMPLETE][11] ([Intel XE#8479]) +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-bmg-10/igt@kms_atomic@test-only.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-6/igt@kms_atomic@test-only.html
    - shard-lnl:          [PASS][12] -> [INCOMPLETE][13] ([Intel XE#8479])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-3/igt@kms_atomic@test-only.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_atomic@test-only.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3658] / [Intel XE#7360])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1407]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7059] / [Intel XE#7085])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2327]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2328] / [Intel XE#7367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#610] / [Intel XE#7387])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#7679])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#367])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#8365])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +10 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#3432]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2887]) +10 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#9204] / [Intel XE#9205]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#9205]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2325] / [Intel XE#7358])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#306] / [Intel XE#7358]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7358])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#373]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2252]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-3/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7642]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2390] / [Intel XE#6974])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7642])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][40] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2321] / [Intel XE#7355]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2321] / [Intel XE#7355])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2320]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1424]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#309] / [Intel XE#7343]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1508])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#4354] / [Intel XE#5882])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#4354] / [Intel XE#7450])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#9009])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8265]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#8265]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#4422] / [Intel XE#7442]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#8680])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1421]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][55] ([Intel XE#301]) +2 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#301] / [Intel XE#3149])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][58] -> [ABORT][59] ([Intel XE#9093]) +1 other test abort
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7178] / [Intel XE#7351])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#7179])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#7178] / [Intel XE#7349])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#7179])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#656] / [Intel XE#7905]) +30 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2311]) +44 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7061]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4141]) +10 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#6312] / [Intel XE#651]) +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2352] / [Intel XE#7399])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#6312]) +12 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#7905]) +40 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1469] / [Intel XE#7399])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7865]) +24 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2313]) +44 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7061]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1503])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#6900] / [Intel XE#7362])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#4090] / [Intel XE#7443])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#8348])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#7591])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2486])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#8303]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#7283]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#7283]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#8076])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#599] / [Intel XE#7382]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#599])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#4596] / [Intel XE#5854])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-10/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1131])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          NOTRUN -> [FAIL][97] ([Intel XE#8399])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-lnl:          [PASS][98] -> [FAIL][99] ([Intel XE#8399])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-7/igt@kms_pm_dc@dc5-psr-suspend-resume.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#4608]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1489]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2387] / [Intel XE#7429])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1406] / [Intel XE#7345])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-render@edp-1.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1406]) +6 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2234])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-4/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2330] / [Intel XE#5813])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#1435] / [Intel XE#8695])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1435] / [Intel XE#9142])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#6503]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#362] / [Intel XE#5848])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2426] / [Intel XE#5848])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#8397])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1499])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#6599])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#5191] / [Intel XE#7316] / [Intel XE#7346]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html

  * igt@xe_evict@evict-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#6540] / [Intel XE#688]) +10 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#7482]) +17 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2322] / [Intel XE#7372]) +7 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1392]) +6 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#8374]) +8 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#8374]) +13 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#8364]) +22 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#8364]) +27 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#8369]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#8369])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#6196])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#8378]) +8 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#8378]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#7954])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#2229])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#6964]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#6964]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#7793]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#7793])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          NOTRUN -> [FAIL][145] ([Intel XE#7695])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#7590] / [Intel XE#7772])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#5694] / [Intel XE#7370])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-7/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#584] / [Intel XE#7369]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [PASS][149] -> [INCOMPLETE][150] ([Intel XE#8175])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-bmg-9/igt@xe_pm@s3-exec-after.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-6/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#4650] / [Intel XE#7347]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#7599])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#944]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#944]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_flr@flr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#7569])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_sriov_flr@flr-basic.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#4273])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#8339])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@xe_sriov_vram@vf-access-provisioned.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][160] ([Intel XE#301]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][162] ([Intel XE#7308]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-bmg-5/igt@kms_hdmi_inject@inject-audio.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-3/igt@kms_hdmi_inject@inject-audio.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][164], [SKIP][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-2/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-3/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-3/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-3/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-2/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-2/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-3/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-7/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-7/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-4/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-7/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-5/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-5/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-4/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-4/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-5/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-8/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-8/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-8/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-1/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-1/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-1/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_module_load@load.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [INCOMPLETE][207] ([Intel XE#8175]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-bmg-6/igt@xe_pm@s3-basic.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-4/igt@xe_pm@s3-basic.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-lnl:          [FAIL][209] -> [PASS][210] +2 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][211] ([Intel XE#6569]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-bmg:          [FAIL][213] ([Intel XE#7992]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-bmg-2/igt@xe_sriov_vram@vf-access-provisioned.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-3/igt@xe_sriov_vram@vf-access-provisioned.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][215] ([Intel XE#301]) -> [FAIL][216] ([Intel XE#301] / [Intel XE#3149])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-lnl:          [ABORT][217] ([Intel XE#9140] / [Intel XE#9145]) -> [DMESG-WARN][218] ([Intel XE#9130])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-5/igt@xe_exec_reset@gt-reset-fault-injection.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          [INCOMPLETE][219] ([Intel XE#9263]) -> [FAIL][220] ([Intel XE#7695])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-bmg-6/igt@xe_pat@pat-sw-hw-suspend.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@xe_pat@pat-sw-hw-suspend.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7316
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7346
  [Intel XE#7347]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7347
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#9204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9204
  [Intel XE#9205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9205
  [Intel XE#9263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9263
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9094 -> IGTPW_15840
  * Linux: xe-5745-7d3acf4579249aa2d991192f3452017a3d72b797 -> xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0

  IGTPW_15840: 15840
  IGT_9094: b72ca59712e9021e1a1a0a5a89ff5eb74982ad99 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5745-7d3acf4579249aa2d991192f3452017a3d72b797: 7d3acf4579249aa2d991192f3452017a3d72b797
  xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0: 19d79b860b8d526661d2697b4abc21e262f614d0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/index.html

--===============6925273111602233404==
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
<tr><td><b>Series:</b></td><td>tests/kms_color: Add support for background =
color testing. (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/167119/">https://patchwork.freedesktop.org/series/167119/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15840/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15840/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9094_FULL -&gt; XEIGTPW_15840_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15840_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15840_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
840_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic@crtc-invalid-params:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_atomic@crtc-invalid-params.h=
tml">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-bmg-1/igt@kms_atomic@plane-invalid-params.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard=
-bmg-9/igt@kms_atomic@plane-invalid-params.html">FAIL</a> +11 other tests f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-overlay-legacy@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-lnl-2/igt@kms_atomic@plane-overlay-legacy@pipe-a-edp-1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15840/shard-lnl-2/igt@kms_atomic@plane-overlay-legacy@pipe-a-edp-1.html">=
FAIL</a> +13 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9094_FULL and XEIGTPW_15840=
_FULL:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_color@background-color:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.83, 7.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-a-background-color:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-b-background-color:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.94, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-c-background-color:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.99, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-d-background-color:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15840_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-bmg-10/igt@core_hotunplug@hotrebind-lateclose.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/s=
hard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_atomic@atomic-plane-damage.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@test-only:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-bmg-10/igt@kms_atomic@test-only.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-6/igt=
@kms_atomic@test-only.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test inco=
mplete</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-lnl-3/igt@kms_atomic@test-only.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@=
kms_atomic@test-only.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
28">Intel XE#2328</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/610">Intel XE#610</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3=
-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-=
target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-=
target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-=
target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/92=
04">Intel XE#9204</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9205">Intel XE#9205</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_cdclk@mode-transition@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9205">Intel XE#9205</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_chamelium_color@ctm-limited-=
range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-3/igt@kms_chamelium_frames@hdmi-cmp-pl=
anar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7642">Intel XE#7642</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@kms_content_protection@srm@pipe-=
a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-=
max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-64=
x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1424">Intel XE#1424</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking=
-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7450">Intel XE#7450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/86=
80">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_flip@2x-flip-vs-suspend-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-=
interruptible@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1584=
0/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
49">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1584=
0/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093">Intel X=
E#9093</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
uv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel=
 XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385"=
>Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#73=
49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#73=
51</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_flip_scaled_crc@flip-p016-li=
near-to-p016-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +30 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-ab=
gr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr=
-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +44 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr=
-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +10 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-abg=
r161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-=
2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +40 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1469">Intel XE#1469</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7865">Intel XE#7865</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-=
1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +44 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_hdr@static-toggle.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">=
Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7443">Intel XE#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_mst@mst-suspend-read-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-=
modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled=
-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@kms_plane@planar-pixel-format-se=
ttings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_plane_lowres@tiling-none@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
99">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-10/igt@kms_pm_backlight@fade-with-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Inte=
l XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-lnl-7/igt@kms_pm_dc@dc5-psr-suspend-resume.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shar=
d-lnl-8/igt@kms_pm_dc@dc5-psr-suspend-resume.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-render@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@kms_psr@pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-4/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation=
-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-7/igt@kms_sharpness_filter@filter-basi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/362">Intel XE#362</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@kms_vrr@lobf-dc3co.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Int=
el XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@xe_compute@ccs-mode-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
99">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_compute_preempt@compute-preem=
pt-many-vram-evict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5191">Intel XE#5191</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7316">Intel XE#7316</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7346">Intel XE#7346</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_evict@evict-cm-threads-small.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@xe_exec_balancer@many-parallel-u=
serptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-6/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Int=
el XE#7372</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-n=
ull-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-im=
m:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueu=
es-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +8 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@xe_exec_fault_mode@twice-multi-q=
ueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8374">Intel XE#8374</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-p=
reempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +22 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_exec_multi_queue@many-queues-=
preempt-mode-fault-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +27 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat=
-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_exec_reset@multi-queue-long-s=
pin-reuse-many-queue-switch.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@xe_exec_system_allocator@pat-ind=
ex-madvise-pat-idx-uc-comp-multi-vma.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_exec_threads@threads-multi-qu=
eue-mixed-shared-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-10/igt@xe_exec_threads@threads-multi-q=
ueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_gpgpu_fill@offset-4x4.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/795=
4">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_live_ktest@xe_bo@xe_bo_evict_=
kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_mmap@pci-membarrier-parallel.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7322">Intel XE#7322</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_multigpu_svm@mgpu-coherency-p=
refetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@xe_multigpu_svm@mgpu-concurrent-=
access-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6964">Intel XE#6964</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_page_reclaim@binds-null-vma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-1/igt@xe_page_reclaim@prl-invalidate-f=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-2/igt@xe_pat@pat-sw-hw-compare.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/769=
5">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_pat@xa-app-transient-media-on=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7590">Intel XE#7590</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7772">Intel XE#7772</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-7/igt@xe_pm@d3cold-i2c.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel=
 XE#5694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_pm@s3-d3hot-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7369">Intel XE#7369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-bmg-9/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-bmg-6/igt@x=
e_pm@s3-exec-after.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@xe_pm@s4-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@xe_pmu@all-fn-engine-activity-lo=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4650">Intel XE#4650</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7347">Intel XE#7347</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_prefetch_fault@prefetch-fault=
-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_query@multigpu-query-pxp-stat=
us.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_sriov_flr@flr-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569"=
>Intel XE#7569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@xe_sriov_flr@flr-twice.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273"=
>Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_sriov_scheduling@equal-throug=
hput-normal-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15840/shard-lnl-7/igt@xe_sriov_vram@vf-access-provisio=
ned.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6376">Intel XE#6376</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15840/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-bmg-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#=
7308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15840/shard-bmg-3/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_9094/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-3/igt@xe_modul=
e_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_9094/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_9094/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_9094/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_9094/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_9094/shard-lnl-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-ln=
l-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_9094/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard=
-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9094=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9=
094/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_9094/shard-lnl-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_9094/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#=
7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15840/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15840/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15840/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-ln=
l-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15840/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15840/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard=
-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
840/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15840/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15840/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-bmg-6/igt@xe_pm@s3-basic.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/sh=
ard-bmg-4/igt@xe_pm@s3-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15840/shar=
d-lnl-7/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel X=
E#6569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15840/shard-bmg-8/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a> +1 oth=
er test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-bmg-2/igt@xe_sriov_vram@vf-access-provisioned.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">In=
tel XE#7992</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15840/shard-bmg-3/igt@xe_sriov_vram@vf-access-provisioned.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15840/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149=
">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-lnl-5/igt@xe_exec_reset@gt-reset-fault-injection.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140=
">Intel XE#9140</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9145">Intel XE#9145</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15840/shard-lnl-3/igt@xe_exec_reset@gt-reset-fault=
-injection.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_9094/shard-bmg-6/igt@xe_pat@pat-sw-hw-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9263">Intel X=
E#9263</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15840/shard-bmg-1/igt@xe_pat@pat-sw-hw-suspend.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a=
>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9094 -&gt; IGTPW_15840</li>
<li>Linux: xe-5745-7d3acf4579249aa2d991192f3452017a3d72b797 -&gt; xe-5746-1=
9d79b860b8d526661d2697b4abc21e262f614d0</li>
</ul>
<p>IGTPW_15840: 15840<br />
  IGT_9094: b72ca59712e9021e1a1a0a5a89ff5eb74982ad99 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5745-7d3acf4579249aa2d991192f3452017a3d72b797: 7d3acf4579249aa2d991192=
f3452017a3d72b797<br />
  xe-5746-19d79b860b8d526661d2697b4abc21e262f614d0: 19d79b860b8d526661d2697=
b4abc21e262f614d0</p>

</body>
</html>

--===============6925273111602233404==--
