Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53C7D729E9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 15:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5868010E4E8;
	Fri, 29 Nov 2024 15:55:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5472A10E4E8;
 Fri, 29 Nov 2024 15:55:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1751963431831937051=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Skip_test_if_joiner_displa?=
 =?utf-8?q?y_is_connected_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Nov 2024 15:55:51 -0000
Message-ID: <173289575132.334878.9026230298747231671@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129042746.701796-1-jeevan.b@intel.com>
In-Reply-To: <20241129042746.701796-1-jeevan.b@intel.com>
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

--===============1751963431831937051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Skip test if joiner display is connected (rev5)
URL   : https://patchwork.freedesktop.org/series/141614/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8130_full -> XEIGTPW_12218_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12218_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12218_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12218_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@crc:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +2 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_async_flips@crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_async_flips@crc@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][4] +114 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-lnl:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@xe_query@query-oa-units:
    - shard-bmg:          [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@xe_query@query-oa-units.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_query@query-oa-units.html

  
#### Warnings ####

  * igt@kms_async_flips@crc:
    - shard-bmg:          [SKIP][12] ([Intel XE#2423]) -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_async_flips@crc.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_async_flips@crc.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [SKIP][14] ([Intel XE#1130]) -> [DMESG-WARN][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12218_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@many-magics:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@core_auth@many-magics.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#3007]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-0.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2550]) +11 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs.html

  * igt@kms_big_fb:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][20] ([Intel XE#2594])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_big_fb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [PASS][22] -> [DMESG-FAIL][23] ([Intel XE#3468]) +15 other tests dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2327]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#316]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1124]) +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#1124]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2328])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#619]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#607])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2314] / [Intel XE#2894])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#2191]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#367]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#367])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#787]) +143 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2887]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#2907]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][38] ([Intel XE#3468]) +1 other test incomplete
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][39] ([Intel XE#3468]) +2 other tests dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#3432]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel XE#787]) +42 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][42] ([Intel XE#1727])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][43] ([Intel XE#1727] / [Intel XE#3113])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2652] / [Intel XE#787]) +28 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2325])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#306]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2252]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#373]) +10 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#1178]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#455]) +25 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2320]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#308]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2321]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][54] ([Intel XE#3468]) +5 other tests dmesg-fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2291]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#323])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2244])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#701])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1137])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][61] -> [FAIL][62] ([Intel XE#3486])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][63] ([Intel XE#3321] / [Intel XE#3487])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][64] ([Intel XE#2882])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][65] -> [INCOMPLETE][66] ([Intel XE#1727] / [Intel XE#2049] / [Intel XE#2597] / [Intel XE#3468])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][67] -> [DMESG-FAIL][68] ([Intel XE#3468]) +1 other test dmesg-fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#2316])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][71] -> [SKIP][72] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][73] -> [FAIL][74] ([Intel XE#2882]) +3 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#301]) +6 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][76] ([Intel XE#3486])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][77] ([Intel XE#301] / [Intel XE#3486])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [PASS][78] -> [DMESG-WARN][79] ([Intel XE#2705] / [Intel XE#3468])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_flip@flip-vs-panning-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][80] -> [DMESG-FAIL][81] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests dmesg-fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [PASS][82] -> [DMESG-FAIL][83] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp5:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][84] ([Intel XE#1727] / [Intel XE#3468])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-dp5.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp5:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][85] ([Intel XE#3468])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@b-dp5.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][86] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp5:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][87] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp5.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][88] ([Intel XE#3468]) +23 other tests dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][89] -> [INCOMPLETE][90] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests incomplete
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-bmg:          [PASS][91] -> [DMESG-WARN][92] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468]) +1 other test dmesg-warn
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2380])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-bmg:          [PASS][94] -> [SKIP][95] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2293]) +10 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2312]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#651]) +28 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-dg2-set2:     [PASS][100] -> [INCOMPLETE][101] ([Intel XE#3468])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [FAIL][102] ([Intel XE#2333]) +8 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#2136]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2352])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2311]) +12 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2136] / [Intel XE#2351])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#658])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2313]) +8 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#653]) +28 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2136]) +6 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [PASS][114] -> [DMESG-WARN][115] ([Intel XE#3468]) +4 other tests dmesg-warn
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_hdr@bpc-switch-suspend.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][116] ([Intel XE#1727]) +2 other tests dmesg-warn
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_invalid_mode@clock-too-high@pipe-a-hdmi-a-6.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#346]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#346]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][119] -> [DMESG-WARN][120] ([Intel XE#877]) +1 other test dmesg-warn
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-3.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-3.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#356])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][122] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][123] ([Intel XE#1727] / [Intel XE#3468])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][124] -> [INCOMPLETE][125] ([Intel XE#1727]) +3 other tests incomplete
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-hdmi-a-6.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-hdmi-a-6.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][126] ([Intel XE#616]) +3 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2493])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2763]) +5 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2763]) +36 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#870])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#870])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][133] -> [FAIL][134] ([Intel XE#718])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][135] -> [FAIL][136] ([Intel XE#1430])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2505])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#908])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [PASS][139] -> [DMESG-WARN][140] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests dmesg-warn
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [ABORT][141] ([Intel XE#3468])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1489]) +8 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#1489]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#2850] / [Intel XE#929]) +19 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2414])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2939])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#3414])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#3414])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#1127])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][151] -> [SKIP][152] ([Intel XE#1435])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][153] ([Intel XE#1729])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#362])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2450])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][156] -> [FAIL][157] ([Intel XE#899]) +2 other tests fail
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][158] -> [DMESG-WARN][159] ([Intel XE#1727] / [Intel XE#3468]) +6 other tests dmesg-warn
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][160] -> [FAIL][161] ([Intel XE#2159]) +1 other test fail
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#1499])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#756])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#1091] / [Intel XE#2849])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#1123])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#2905]) +12 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2905]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-bmg:          [PASS][168] -> [DMESG-WARN][169] ([Intel XE#3468]) +84 other tests dmesg-warn
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@xe_evict@evict-large-external-cm.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_evict@evict-threads-small:
    - shard-bmg:          [PASS][170] -> [DMESG-WARN][171] ([Intel XE#1727]) +2 other tests dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@xe_evict@evict-threads-small.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@xe_evict@evict-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [PASS][172] -> [SKIP][173] ([Intel XE#1130]) +10 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2322]) +5 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#1130])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#288]) +14 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#2360])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:
    - shard-bmg:          [PASS][178] -> [SKIP][179] ([Intel XE#1130]) +10 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr:
    - shard-dg2-set2:     [PASS][180] -> [DMESG-WARN][181] ([Intel XE#1727]) +13 other tests dmesg-warn
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#1130]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][183] ([Intel XE#3467]) +1 other test dmesg-warn
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][184] ([Intel XE#3467])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][185] ([Intel XE#3343])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#2229])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#378])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][188] -> [DMESG-WARN][189] ([Intel XE#3467]) +1 other test dmesg-warn
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@xe_module_load@many-reload.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_module_load@many-reload.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#3573]) +6 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [PASS][191] -> [FAIL][192] ([Intel XE#2514])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][193] ([Intel XE#2514])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-bmg:          NOTRUN -> [FAIL][194] ([Intel XE#2514])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#1337])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][196] ([Intel XE#2284] / [Intel XE#366])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][197] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [PASS][198] -> [DMESG-WARN][199] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@xe_pm@s4-mocs.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#944]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#944]) +4 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     NOTRUN -> [FAIL][202] ([Intel XE#2922])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_tlb@basic-tlb.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [SKIP][203] ([Intel XE#1885]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@core_hotunplug@hotrebind.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [DMESG-WARN][205] ([Intel XE#3468]) -> [PASS][206] +4 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][207] ([Intel XE#3339]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@eof:
    - shard-bmg:          [SKIP][209] ([Intel XE#2134]) -> [PASS][210] +2 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@fbdev@eof.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@fbdev@eof.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [SKIP][211] ([Intel XE#2136]) -> [PASS][212] +22 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [INCOMPLETE][213] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][215] ([Intel XE#2291]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@forked-bo:
    - shard-bmg:          [DMESG-WARN][217] ([Intel XE#877]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_cursor_legacy@forked-bo.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_cursor_legacy@forked-bo.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][219] ([Intel XE#2932]) -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][221] ([Intel XE#3009]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_dp_aux_dev.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_dp_aux_dev.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [FAIL][223] ([Intel XE#2958]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][225] ([Intel XE#301]) -> [PASS][226] +1 other test pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp5:
    - shard-dg2-set2:     [FAIL][227] -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp5.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp5.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [SKIP][229] ([Intel XE#2316]) -> [PASS][230] +4 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][231] ([Intel XE#2423]) -> [PASS][232] +137 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][233] ([Intel XE#3468]) -> [PASS][234] +26 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][235] ([Intel XE#2049]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][237] -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][239] ([Intel XE#2566] / [Intel XE#3468]) -> [PASS][240] +1 other test pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:
    - shard-bmg:          [DMESG-WARN][241] -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html

  * igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][243] ([Intel XE#3527]) -> [PASS][244] +1 other test pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [ABORT][245] ([Intel XE#3468]) -> [PASS][246] +1 other test pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_pm_rpm@basic-rte.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [INCOMPLETE][247] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][248] +4 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_pm_rpm@cursor.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][249] ([Intel XE#2446]) -> [PASS][250] +6 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_pm_rpm@i2c.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          [DMESG-FAIL][251] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_pm_rpm@universal-planes.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          [INCOMPLETE][253] -> [PASS][254] +1 other test pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][255] ([Intel XE#3559]) -> [PASS][256] +3 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html

  * igt@kms_vblank@query-busy:
    - shard-dg2-set2:     [INCOMPLETE][257] ([Intel XE#1727]) -> [PASS][258] +3 other tests pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_vblank@query-busy.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_vblank@query-busy.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][259] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][260] +11 other tests pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][261] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][262] +9 other tests pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [FAIL][263] ([Intel XE#1522]) -> [PASS][264] +1 other test pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-3/igt@kms_vrr@max-min.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-7/igt@kms_vrr@max-min.html

  * igt@xe_exec_basic@many-basic-defer-mmap:
    - shard-bmg:          [DMESG-WARN][265] ([Intel XE#3468]) -> [PASS][266] +61 other tests pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@xe_exec_basic@many-basic-defer-mmap.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_exec_basic@many-basic-defer-mmap.html

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [DMESG-WARN][267] ([Intel XE#1727]) -> [PASS][268] +5 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-rebind:
    - shard-lnl:          [FAIL][269] -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-1/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_compute_mode@many-execqueues-basic:
    - shard-dg2-set2:     [DMESG-WARN][271] ([Intel XE#1727]) -> [PASS][272] +14 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-basic.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-basic.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:
    - shard-lnl:          [DMESG-WARN][273] -> [PASS][274] +1 other test pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-8/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-5/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [DMESG-WARN][275] ([Intel XE#3343] / [Intel XE#3468]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [DMESG-WARN][277] ([Intel XE#3343]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-bmg:          [DMESG-WARN][279] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1192]) -> [PASS][282] +1 other test pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [DMESG-WARN][283] ([Intel XE#3467]) -> [PASS][284] +2 other tests pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@xe_module_load@unload.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_module_load@unload.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-lnl:          [FAIL][285] ([Intel XE#2249]) -> [PASS][286] +1 other test pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-4/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [DMESG-WARN][287] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@xe_pm@s3-exec-after.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [DMESG-WARN][289] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@xe_pm@s3-multiple-execs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][291] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_pm@s4-vm-bind-userptr.html
    - shard-bmg:          [DMESG-WARN][293] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@xe_pm@s4-vm-bind-userptr.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][295] ([Intel XE#958]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_prime_self_import@basic-llseek-size:
    - shard-bmg:          [DMESG-WARN][297] ([Intel XE#2705]) -> [PASS][298] +1 other test pass
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@xe_prime_self_import@basic-llseek-size.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@xe_prime_self_import@basic-llseek-size.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][299] ([Intel XE#1130]) -> [PASS][300] +320 other tests pass
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@core_auth@many-magics:
    - shard-bmg:          [SKIP][301] ([Intel XE#2423]) -> [SKIP][302] ([Intel XE#3007]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@core_auth@many-magics.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@core_auth@many-magics.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][303] ([Intel XE#2423]) -> [SKIP][304] ([Intel XE#873])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_interruptible@legacy-cursor:
    - shard-bmg:          [SKIP][305] ([Intel XE#2423]) -> [DMESG-WARN][306] ([Intel XE#3468]) +5 other tests dmesg-warn
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_atomic_interruptible@legacy-cursor.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_atomic_interruptible@legacy-cursor.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][307] ([Intel XE#2136]) -> [SKIP][308] ([Intel XE#2327]) +8 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [SKIP][309] ([Intel XE#2136]) -> [SKIP][310] ([Intel XE#2136] / [Intel XE#2231]) +10 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-bmg:          [SKIP][311] ([Intel XE#2136]) -> [DMESG-WARN][312] ([Intel XE#3468])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][313] ([Intel XE#3468]) -> [SKIP][314] ([Intel XE#2136] / [Intel XE#2231])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#607])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#1124]) +17 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1124]) -> [SKIP][320] ([Intel XE#2136])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][321] ([Intel XE#2423]) -> [SKIP][322] ([Intel XE#2314] / [Intel XE#2894])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][323] ([Intel XE#2423]) -> [SKIP][324] ([Intel XE#367]) +7 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][326] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][327] ([Intel XE#2887]) -> [SKIP][328] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][329] ([Intel XE#2136]) -> [SKIP][330] ([Intel XE#3432]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][331] ([Intel XE#2136]) -> [SKIP][332] ([Intel XE#2887]) +24 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][333] ([Intel XE#2136]) -> [SKIP][334] ([Intel XE#2652] / [Intel XE#787]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][335] ([Intel XE#2136]) -> [SKIP][336] ([Intel XE#2724])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_cdclk@plane-scaling.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#306]) -> [SKIP][338] ([Intel XE#2423] / [i915#2575])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][339] ([Intel XE#2423]) -> [SKIP][340] ([Intel XE#2325]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_chamelium_color@degamma.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#373]) -> [SKIP][342] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          [SKIP][343] ([Intel XE#2423]) -> [SKIP][344] ([Intel XE#2252]) +16 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-bmg:          [SKIP][345] ([Intel XE#2252]) -> [SKIP][346] ([Intel XE#3007])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][347] ([Intel XE#1178]) -> [SKIP][348] ([Intel XE#2341])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_content_protection@atomic.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][349] ([Intel XE#2423]) -> [SKIP][350] ([Intel XE#2390])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][351] ([Intel XE#2423]) -> [SKIP][352] ([Intel XE#2341]) +3 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_content_protection@legacy.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][353] ([Intel XE#2715] / [Intel XE#3468]) -> [FAIL][354] ([Intel XE#1178]) +1 other test fail
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][355] ([Intel XE#2423]) -> [SKIP][356] ([Intel XE#2321]) +3 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          [SKIP][357] ([Intel XE#2423]) -> [SKIP][358] ([Intel XE#2320]) +7 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][359] ([Intel XE#2423]) -> [SKIP][360] ([Intel XE#2291])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          [SKIP][361] ([Intel XE#2423]) -> [SKIP][362] ([Intel XE#2286]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][363] ([Intel XE#2423]) -> [DMESG-WARN][364] ([Intel XE#877]) +1 other test dmesg-warn
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][365] ([Intel XE#3468] / [Intel XE#877]) -> [SKIP][366] ([Intel XE#2291])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][367] ([Intel XE#2136]) -> [SKIP][368] ([Intel XE#1508])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [DMESG-FAIL][369] ([Intel XE#3468]) -> [FAIL][370] ([Intel XE#2141]) +2 other tests fail
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][371] ([Intel XE#2136]) -> [SKIP][372] ([Intel XE#2244]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#455]) -> [SKIP][374] ([Intel XE#2136] / [Intel XE#2351])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html
    - shard-bmg:          [SKIP][375] ([Intel XE#2244]) -> [SKIP][376] ([Intel XE#2136] / [Intel XE#2231])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][377] ([Intel XE#2136]) -> [FAIL][378] ([Intel XE#1695])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][379] ([Intel XE#2423]) -> [SKIP][380] ([Intel XE#1138])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][381] ([Intel XE#2423]) -> [SKIP][382] ([Intel XE#2374])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_feature_discovery@psr2.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][383] ([Intel XE#3468]) -> [FAIL][384] ([Intel XE#2882]) +3 other tests fail
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][385] ([Intel XE#2423]) -> [FAIL][386] ([Intel XE#2882])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [DMESG-FAIL][387] ([Intel XE#3468]) -> [FAIL][388] ([Intel XE#2882]) +2 other tests fail
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [SKIP][389] ([Intel XE#2423]) -> [SKIP][390] ([Intel XE#2316]) +2 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][391] ([Intel XE#2136]) -> [SKIP][392] ([Intel XE#2293] / [Intel XE#2380]) +7 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][393] ([Intel XE#2136]) -> [SKIP][394] ([Intel XE#2380])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][395] ([Intel XE#2136]) -> [SKIP][396] ([Intel XE#2311]) +49 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][397] ([Intel XE#2312]) -> [SKIP][398] ([Intel XE#2311]) +6 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][399] ([Intel XE#2312]) -> [SKIP][400] ([Intel XE#2136] / [Intel XE#2231])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#651]) -> [SKIP][402] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][403] ([Intel XE#2136]) -> [DMESG-FAIL][404] ([Intel XE#3468]) +6 other tests dmesg-fail
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][405] ([Intel XE#3468]) -> [SKIP][406] ([Intel XE#2312])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [FAIL][407] ([Intel XE#2333]) -> [DMESG-FAIL][408] ([Intel XE#3468]) +4 other tests dmesg-fail
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][409] ([Intel XE#3468]) -> [FAIL][410] ([Intel XE#2333]) +5 other tests fail
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [FAIL][411] ([Intel XE#2333]) -> [SKIP][412] ([Intel XE#2312])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][413] ([Intel XE#2312]) -> [FAIL][414] ([Intel XE#2333]) +4 other tests fail
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][415] ([Intel XE#2136]) -> [FAIL][416] ([Intel XE#2333]) +20 other tests fail
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][417] ([Intel XE#2311]) -> [SKIP][418] ([Intel XE#2136] / [Intel XE#2231])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#651]) -> [SKIP][420] ([Intel XE#2136]) +2 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][421] ([Intel XE#2311]) -> [SKIP][422] ([Intel XE#2312]) +3 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#653]) -> [SKIP][424] ([Intel XE#2136]) +2 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][425] ([Intel XE#2313]) -> [SKIP][426] ([Intel XE#2312]) +3 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][427] ([Intel XE#2313]) -> [SKIP][428] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][429] ([Intel XE#2136]) -> [SKIP][430] ([Intel XE#2312]) +11 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][431] ([Intel XE#2136]) -> [SKIP][432] ([Intel XE#2313]) +50 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][433] ([Intel XE#2136]) -> [SKIP][434] ([Intel XE#2352])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][435] ([Intel XE#2312]) -> [SKIP][436] ([Intel XE#2313]) +9 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][437] ([Intel XE#3544]) -> [SKIP][438] ([Intel XE#3374] / [Intel XE#3544])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][439] ([Intel XE#2136]) -> [SKIP][440] ([Intel XE#2927]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][441] ([Intel XE#2136]) -> [SKIP][442] ([Intel XE#3012])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [SKIP][443] ([Intel XE#2423]) -> [INCOMPLETE][444] ([Intel XE#1727] / [Intel XE#3468])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][445] ([Intel XE#2423]) -> [SKIP][446] ([Intel XE#2763]) +7 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][447] ([Intel XE#2136]) -> [SKIP][448] ([Intel XE#2391])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][449] ([Intel XE#2392]) -> [SKIP][450] ([Intel XE#2136] / [Intel XE#2231])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][451] ([Intel XE#2136]) -> [SKIP][452] ([Intel XE#2392])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][453] ([Intel XE#1439]) -> [SKIP][454] ([Intel XE#1439] / [Intel XE#836])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          [SKIP][455] ([Intel XE#1439]) -> [SKIP][456] ([Intel XE#1439] / [Intel XE#836])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][457] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][458] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +2 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [DMESG-WARN][459] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][460] ([Intel XE#2446])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-bmg:          [SKIP][461] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][462] ([Intel XE#2446])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [DMESG-WARN][463] ([Intel XE#2042] / [Intel XE#3468]) -> [ABORT][464] ([Intel XE#3468])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_pm_rpm@universal-planes.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-77:
    - shard-dg2-set2:     [DMESG-WARN][465] ([Intel XE#1727] / [Intel XE#3468]) -> [ABORT][466] ([Intel XE#3468])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_pm_rpm@universal-planes@plane-77.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_pm_rpm@universal-planes@plane-77.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][467] ([Intel XE#1489]) -> [SKIP][468] ([Intel XE#2136] / [Intel XE#2231])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#1489]) -> [SKIP][470] ([Intel XE#2136])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][471] ([Intel XE#2136]) -> [SKIP][472] ([Intel XE#1489]) +12 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][473] ([Intel XE#2136]) -> [SKIP][474] ([Intel XE#2387])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][475] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][476] ([Intel XE#2136] / [Intel XE#2231])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][478] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_psr@pr-sprite-plane-onoff.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][479] ([Intel XE#2136]) -> [SKIP][480] ([Intel XE#2234] / [Intel XE#2850]) +26 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_psr@psr-basic.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][481] ([Intel XE#2136]) -> [SKIP][482] ([Intel XE#2234])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_psr@psr2-primary-render.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-bmg:          [SKIP][483] ([Intel XE#2423]) -> [DMESG-FAIL][484] ([Intel XE#3468]) +2 other tests dmesg-fail
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][485] ([Intel XE#2423]) -> [SKIP][486] ([Intel XE#2330]) +1 other test skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][487] ([Intel XE#2423]) -> [SKIP][488] ([Intel XE#3414]) +1 other test skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][489] ([Intel XE#2423]) -> [SKIP][490] ([Intel XE#2413])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][491] ([Intel XE#2423]) -> [SKIP][492] ([Intel XE#2426])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][493] ([Intel XE#2423]) -> [SKIP][494] ([Intel XE#1499])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vrr.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          [SKIP][495] ([Intel XE#2423]) -> [SKIP][496] ([Intel XE#756]) +2 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][497] ([Intel XE#2423]) -> [SKIP][498] ([Intel XE#1091] / [Intel XE#2849])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1126]) -> [SKIP][500] ([Intel XE#1130])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][501] ([Intel XE#1130]) -> [SKIP][502] ([Intel XE#2504])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#2905]) -> [SKIP][504] ([Intel XE#1130]) +1 other test skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@xe_eudebug@multigpu-basic-client-many.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_eudebug@multigpu-basic-client-many.html
    - shard-bmg:          [SKIP][505] ([Intel XE#2905]) -> [SKIP][506] ([Intel XE#1130])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@xe_eudebug@multigpu-basic-client-many.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][507] ([Intel XE#1130]) -> [SKIP][508] ([Intel XE#2905]) +17 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          [SKIP][509] ([Intel XE#1130]) -> [FAIL][510] ([Intel XE#2364])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][511] ([Intel XE#1473]) -> [TIMEOUT][512] ([Intel XE#1473])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
    - shard-bmg:          [SKIP][513] ([Intel XE#1130]) -> [TIMEOUT][514] ([Intel XE#1473])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [DMESG-FAIL][515] ([Intel XE#3468]) -> [FAIL][516] ([Intel XE#2364])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html
    - shard-dg2-set2:     [DMESG-FAIL][517] ([Intel XE#1727]) -> [FAIL][518] ([Intel XE#1600])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][519] ([Intel XE#1473]) -> [INCOMPLETE][520] ([Intel XE#1473])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@many-execqueues-rebind:
    - shard-bmg:          [SKIP][521] ([Intel XE#1130]) -> [DMESG-WARN][522] ([Intel XE#3468]) +4 other tests dmesg-warn
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_exec_basic@many-execqueues-rebind.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_exec_basic@many-execqueues-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][523] ([Intel XE#1130]) -> [SKIP][524] ([Intel XE#2322]) +14 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#288]) -> [SKIP][526] ([Intel XE#1130])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html

  * igt@xe_exec_threads@threads-hang-basic:
    - shard-bmg:          [SKIP][527] ([Intel XE#1130]) -> [DMESG-WARN][528] ([Intel XE#1727]) +1 other test dmesg-warn
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_exec_threads@threads-hang-basic.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@xe_exec_threads@threads-hang-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-bmg:          [SKIP][529] ([Intel XE#1130]) -> [DMESG-WARN][530] ([Intel XE#3343] / [Intel XE#3468])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-bmg:          [DMESG-WARN][531] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][532] ([Intel XE#3467])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-dg2-set2:     [DMESG-WARN][533] ([Intel XE#3467]) -> [SKIP][534] ([Intel XE#1130])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [FAIL][535] ([Intel XE#3499]) -> [DMESG-FAIL][536] ([Intel XE#3467] / [Intel XE#3468])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [SKIP][537] ([Intel XE#1130]) -> [FAIL][538] ([Intel XE#3499])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [SKIP][539] ([Intel XE#1130]) -> [DMESG-WARN][540] ([Intel XE#3467])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#1192]) -> [SKIP][542] ([Intel XE#455])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@xe_live_ktest@xe_eudebug.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][543] ([Intel XE#1130]) -> [SKIP][544] ([Intel XE#2459] / [Intel XE#2596])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_media_fill@media-fill.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][545] ([Intel XE#1130]) -> [SKIP][546] ([Intel XE#586])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_mmap@small-bar.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [FAIL][547] ([Intel XE#3625]) -> [DMESG-WARN][548] ([Intel XE#3467])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_module_load@reload.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_module_load@reload.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#3573]) -> [SKIP][550] ([Intel XE#1130])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@xe_oa@buffer-fill.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-bmg:          [SKIP][551] ([Intel XE#1130]) -> [FAIL][552] ([Intel XE#2514])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][553] ([Intel XE#1130]) -> [SKIP][554] ([Intel XE#2236])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][555] ([Intel XE#1130]) -> [SKIP][556] ([Intel XE#2284]) +3 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][557] ([Intel XE#1130]) -> [SKIP][558] ([Intel XE#579])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          [SKIP][559] ([Intel XE#944]) -> [SKIP][560] ([Intel XE#1130])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#944]) -> [SKIP][562] ([Intel XE#1130])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][563] ([Intel XE#1130]) -> [SKIP][564] ([Intel XE#944]) +4 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][565] ([Intel XE#1130]) -> [SKIP][566] ([Intel XE#3342]) +1 other test skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][567] ([Intel XE#1727] / [Intel XE#2919]) -> [SKIP][568] ([Intel XE#1130])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@xe_wedged@basic-wedged.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [ABORT][569] -> [SKIP][570] ([Intel XE#1130])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html
    - shard-dg2-set2:     [ABORT][571] ([Intel XE#3421]) -> [SKIP][572] ([Intel XE#1130])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3625
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8130 -> IGTPW_12218
  * Linux: xe-2291-5379d0a88558b73308ad82f163e80b863626e90b -> xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee

  IGTPW_12218: 12218
  IGT_8130: 52c84deb5f45bcbd3c2b22d1fcff01d4c522cb62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2291-5379d0a88558b73308ad82f163e80b863626e90b: 5379d0a88558b73308ad82f163e80b863626e90b
  xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee: 709349e154b56980b3957b3f72af3f67cfdd7aee

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/index.html

--===============1751963431831937051==
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
<tr><td><b>Series:</b></td><td>Skip test if joiner display is connected (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141614/">https://patchwork.freedesktop.org/series/141614/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8130_full -&gt; XEIGTPW_12218_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12218_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12218_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12218_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_async_flips@crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_async_flips@crc.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_async_flips@crc@pipe-a-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> +114 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@query-oa-units:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@xe_query@query-oa-units.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_query@query-oa-units.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_async_flips@crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_async_flips@crc.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12218_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@many-magics:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@core_auth@many-magics.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-5-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_big_fb.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +15 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +143 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_flip@absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_flip@flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_flip@flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-dp5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@b-dp5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +23 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_invalid_mode@clock-too-high@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@xe_evict@evict-large-external-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_evict@evict-large-external-cm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +84 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@xe_evict@evict-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@xe_evict@evict-threads-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@core_hotunplug@hotrebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@fbdev@eof.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_cursor_legacy@forked-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_cursor_legacy@forked-bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958">Intel XE#2958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp5:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp5.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +137 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527">Intel XE#3527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_pm_rpm@basic-rte.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_pm_rpm@basic-rte.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_pm_rpm@cursor.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_pm_rpm@cursor.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_pm_rpm@i2c.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_pm_rpm@universal-planes.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559">Intel XE#3559</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_vblank@query-busy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@kms_vblank@query-busy.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-6.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-3/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-7/igt@kms_vrr@max-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@xe_exec_basic@many-basic-defer-mmap.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_exec_basic@many-basic-defer-mmap.html">PASS</a> +61 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-1/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-basic.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-8/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-5/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_module_load@unload.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-4/igt@xe_oa@mmio-triggered-reports.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@xe_pm@s3-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@xe_pm@s3-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-llseek-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@xe_prime_self_import@basic-llseek-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@xe_prime_self_import@basic-llseek-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +320 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_auth@many-magics:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@core_auth@many-magics.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@core_auth@many-magics.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_atomic_interruptible@legacy-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_atomic_interruptible@legacy-cursor.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_pm_rpm@universal-planes.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-77:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_pm_rpm@universal-planes@plane-77.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@kms_pm_rpm@universal-planes@plane-77.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-3/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_exec_basic@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_exec_basic@many-execqueues-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_exec_threads@threads-hang-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@xe_exec_threads@threads-hang-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-435/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-4/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3625">Intel XE#3625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-5/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8130/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12218/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8130 -&gt; IGTPW_12218</li>
<li>Linux: xe-2291-5379d0a88558b73308ad82f163e80b863626e90b -&gt; xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee</li>
</ul>
<p>IGTPW_12218: 12218<br />
  IGT_8130: 52c84deb5f45bcbd3c2b22d1fcff01d4c522cb62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2291-5379d0a88558b73308ad82f163e80b863626e90b: 5379d0a88558b73308ad82f163e80b863626e90b<br />
  xe-2293-709349e154b56980b3957b3f72af3f67cfdd7aee: 709349e154b56980b3957b3f72af3f67cfdd7aee</p>

</body>
</html>

--===============1751963431831937051==--
