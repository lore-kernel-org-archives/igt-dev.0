Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7EBE77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 17:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F66610E00F;
	Thu,  9 Jan 2025 17:55:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB9A10E00F;
 Thu,  9 Jan 2025 17:55:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5478362599428816959=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_series_starting_with_=5Bi-?=
 =?utf-8?q?g-t=2Cv2=2C1/8=5D_lib/xe/xe=5Fgt=3A_Fix_header_guards_and_boilerp?=
 =?utf-8?q?late?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 09 Jan 2025 17:55:37 -0000
Message-ID: <173644533743.1695038.5841314135090467919@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250107202615.1306306-1-lucas.demarchi@intel.com>
In-Reply-To: <20250107202615.1306306-1-lucas.demarchi@intel.com>
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

--===============5478362599428816959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/8] lib/xe/xe_gt: Fix header guards and boilerplate
URL   : https://patchwork.freedesktop.org/series/143204/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8179_full -> XEIGTPW_12398_full
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

  Here are the changes found in XEIGTPW_12398_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [PASS][1] -> [SKIP][2] ([Intel XE#1885]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#3453])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] ([Intel XE#3249])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#2134])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@fbdev@info.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@fbdev@info.html

  * igt@intel_hwmon@hwmon-write:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1125])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1466])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#3768])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#2423] / [i915#2575]) +147 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1407]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1467])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2191])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#367]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1512])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +9 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2669]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#3433]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#3432]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +83 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#1727] / [Intel XE#3113])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#306])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#373])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#373]) +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#3278])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][31] ([Intel XE#1178])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2321]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1424]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#309]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#323]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([i915#3804])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#2423]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_dp_aux_dev.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#701])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1421]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][41] ([Intel XE#1504]) +1 other test incomplete
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#301] / [Intel XE#3321])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#301]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#886]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1401]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#455]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1401] / [Intel XE#1745]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][49] -> [SKIP][50] ([Intel XE#2351])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#651]) +10 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][52] -> [SKIP][53] ([Intel XE#2136]) +44 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][54] -> [SKIP][55] ([Intel XE#2136] / [Intel XE#2351]) +15 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#656]) +28 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1469]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#2927])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#356])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2763]) +15 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#2763]) +11 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#718])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][66] ([Intel XE#1430])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][67] -> [SKIP][68] ([Intel XE#2446]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1439] / [Intel XE#3141])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2893]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1406]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1127])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1435])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1499])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#756])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1280] / [Intel XE#455])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1130]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_online@resume-one:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2905]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@xe_eudebug_online@resume-one.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][79] -> [TIMEOUT][80] ([Intel XE#1473])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#688]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][82] -> [SKIP][83] ([Intel XE#1130]) +268 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1392]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1416])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@xe_mmap@vram.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][86] ([Intel XE#1173])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          NOTRUN -> [FAIL][88] ([Intel XE#958])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-engines:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#944])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@xe_query@multigpu-query-engines.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][90] ([Intel XE#3440]) -> [PASS][91] +1 other test pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@core_getversion@all-cards.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#1885]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][94] ([Intel XE#3249]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#2134]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@fbdev@write.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@fbdev@write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][98] ([Intel XE#911]) -> [PASS][99] +3 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#2423] / [i915#2575]) -> [PASS][101] +101 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_atomic@plane-invalid-params-fence.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][103] +9 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#2136]) -> [PASS][105] +30 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - shard-dg2-set2:     [FAIL][106] ([Intel XE#301]) -> [PASS][107] +2 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#2446]) -> [PASS][109] +5 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][110] ([Intel XE#899]) -> [PASS][111] +2 other tests pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_exec_compute_mode@many-userptr-rebind:
    - shard-dg2-set2:     [FAIL][112] -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_exec_compute_mode@many-userptr-rebind.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_exec_compute_mode@many-userptr-rebind.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [FAIL][114] ([Intel XE#3546]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_module_load@many-reload.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][116] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-lnl-2/igt@xe_pm@s4-basic.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][118] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1130]) -> [PASS][121] +198 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_query@query-uc-fw-version-huc.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_query@query-uc-fw-version-huc.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#2423] / [i915#2575]) -> [SKIP][123] ([Intel XE#623])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#873]) -> [SKIP][125] ([Intel XE#2423] / [i915#2575])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#316]) -> [SKIP][127] ([Intel XE#2136]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][129] ([Intel XE#316]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#316]) -> [SKIP][131] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#2136]) -> [SKIP][133] ([Intel XE#316]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1124]) -> [SKIP][135] ([Intel XE#2136]) +11 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][137] ([Intel XE#1124]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#610]) -> [SKIP][139] ([Intel XE#2136]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#2136]) -> [SKIP][141] ([Intel XE#1124]) +8 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#2136]) -> [SKIP][143] ([Intel XE#607])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1124]) -> [SKIP][145] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#2191]) -> [SKIP][147] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#2423] / [i915#2575]) -> [SKIP][149] ([Intel XE#367]) +5 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#367]) -> [SKIP][151] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#2907]) -> [SKIP][153] ([Intel XE#2136])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][155] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][157] ([Intel XE#455] / [Intel XE#787])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#2136]) -> [SKIP][159] ([Intel XE#3442])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#2136]) -> [SKIP][161] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#2136]) -> [INCOMPLETE][163] ([Intel XE#1727])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][165] ([Intel XE#2136]) +18 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#314]) -> [SKIP][167] ([Intel XE#2136] / [Intel XE#2351])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#306]) -> [SKIP][169] ([Intel XE#2423] / [i915#2575])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#2423] / [i915#2575]) -> [SKIP][171] ([Intel XE#306]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#2423] / [i915#2575]) -> [SKIP][173] ([Intel XE#373]) +10 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#373]) -> [SKIP][175] ([Intel XE#2423] / [i915#2575]) +17 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#2423] / [i915#2575]) -> [FAIL][177] ([Intel XE#1178])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#2423] / [i915#2575]) -> [SKIP][179] ([Intel XE#307])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][180] ([Intel XE#1178]) -> [SKIP][181] ([Intel XE#2423] / [i915#2575])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_content_protection@legacy.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [INCOMPLETE][182] ([Intel XE#2715]) -> [SKIP][183] ([Intel XE#2423] / [i915#2575])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#2423] / [i915#2575]) -> [SKIP][185] ([Intel XE#308]) +4 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#308]) -> [SKIP][187] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#2423] / [i915#2575]) -> [SKIP][189] ([Intel XE#323]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#323]) -> [SKIP][191] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#455]) -> [SKIP][193] ([Intel XE#2351])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_dsc@dsc-basic.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#2136]) -> [SKIP][195] ([Intel XE#455]) +5 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#455]) -> [SKIP][197] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#2136]) -> [SKIP][199] ([Intel XE#776])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_fbcon_fbt@psr.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#2423] / [i915#2575]) -> [SKIP][201] ([Intel XE#701])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_feature_discovery@chamelium.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#2423] / [i915#2575]) -> [SKIP][203] ([Intel XE#1137])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1135]) -> [SKIP][205] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_feature_discovery@psr1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2423] / [i915#2575]) -> [FAIL][207] ([Intel XE#301])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#455]) -> [SKIP][209] ([Intel XE#2136]) +7 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#651]) -> [SKIP][211] ([Intel XE#2136]) +31 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][213] ([Intel XE#651]) +12 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][215] ([Intel XE#658])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#2136]) -> [SKIP][217] ([Intel XE#651]) +21 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#651]) -> [SKIP][219] ([Intel XE#2136] / [Intel XE#2351]) +14 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#658]) -> [SKIP][221] ([Intel XE#2136] / [Intel XE#2351])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][223] ([Intel XE#653]) +7 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#653]) -> [SKIP][225] ([Intel XE#2136] / [Intel XE#2351]) +13 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#653]) -> [SKIP][227] ([Intel XE#2136]) +38 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#2136]) -> [SKIP][229] ([Intel XE#653]) +30 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#2423] / [i915#2575]) -> [SKIP][231] ([Intel XE#605])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_histogram@algo-color:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#2423] / [i915#2575]) -> [SKIP][233] ([Intel XE#3897])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_histogram@algo-color.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_histogram@algo-color.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2136]) -> [SKIP][235] ([Intel XE#346])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#2925]) -> [SKIP][237] ([Intel XE#2136]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#2423] / [i915#2575]) -> [SKIP][239] ([Intel XE#455]) +5 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_panel_fitting@atomic-fastset.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [FAIL][240] ([Intel XE#361]) -> [SKIP][241] ([Intel XE#2423] / [i915#2575])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][243] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#2423] / [i915#2575]) -> [SKIP][245] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#870]) -> [SKIP][247] ([Intel XE#2136]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_pm_backlight@fade.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1122]) -> [SKIP][249] ([Intel XE#2136] / [Intel XE#2351])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][251] ([Intel XE#1129])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2136]) -> [SKIP][253] ([Intel XE#908])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1489]) -> [SKIP][255] ([Intel XE#2136]) +16 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#2136]) -> [SKIP][257] ([Intel XE#1489]) +8 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#2136]) -> [SKIP][259] ([Intel XE#1122])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][261] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][263] ([Intel XE#2136]) +20 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#2136]) -> [SKIP][265] ([Intel XE#2850] / [Intel XE#929]) +17 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][267] ([Intel XE#2351]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][269] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_psr@psr-dpms.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#2423] / [i915#2575]) -> [SKIP][271] ([Intel XE#3414]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#3414]) -> [SKIP][273] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#1500]) -> [SKIP][275] ([Intel XE#2423] / [i915#2575])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#455]) -> [SKIP][277] ([Intel XE#2423] / [i915#2575]) +16 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_vrr@flipline.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2423] / [i915#2575]) -> [SKIP][279] ([Intel XE#756]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#756]) -> [SKIP][281] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#2423] / [i915#2575]) -> [SKIP][283] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#1130]) -> [SKIP][285] ([Intel XE#1280] / [Intel XE#455])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#1123]) -> [SKIP][287] ([Intel XE#1130]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#1126]) -> [SKIP][289] ([Intel XE#1130])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#1130]) -> [SKIP][291] ([Intel XE#1126])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#1130]) -> [SKIP][293] ([Intel XE#2905]) +13 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_eudebug@basic-vm-bind.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#1130]) -> [SKIP][295] ([Intel XE#3889])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#2905]) -> [SKIP][297] ([Intel XE#1130]) +18 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_eudebug_online@resume-dss.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#1130]) -> [FAIL][299] ([Intel XE#1600])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][300] ([Intel XE#1473]) -> [SKIP][301] ([Intel XE#1130])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@once-basic:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#1130]) -> [SKIP][303] ([Intel XE#288]) +30 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_exec_fault_mode@once-basic.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_exec_fault_mode@once-basic.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#288]) -> [SKIP][305] ([Intel XE#1130]) +44 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#255]) -> [SKIP][307] ([Intel XE#1130])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_huc_copy@huc_copy.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#560]) -> [SKIP][309] ([Intel XE#1130])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_media_fill@media-fill.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][311] ([Intel XE#1130]) +16 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@xe_oa@map-oa-buffer.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_oa@map-oa-buffer.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#1130]) -> [SKIP][313] ([Intel XE#2541] / [Intel XE#3573]) +9 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_oa@syncs-ufence-wait.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#979]) -> [SKIP][315] ([Intel XE#1130])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#1061]) -> [FAIL][317] ([Intel XE#1173])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_peer2peer@read.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][318] ([Intel XE#1173]) -> [SKIP][319] ([Intel XE#1061])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_peer2peer@write.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#1130]) -> [SKIP][321] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#1130]) -> [SKIP][323] ([Intel XE#2284])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][325] ([Intel XE#1130]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#944]) -> [SKIP][327] ([Intel XE#1130]) +5 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#1130]) -> [SKIP][329] ([Intel XE#944]) +3 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#3342]) -> [SKIP][331] ([Intel XE#1130])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#1130]) -> [ABORT][333] ([Intel XE#3075] / [Intel XE#3084])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3897]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3897
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8179 -> IGTPW_12398
  * Linux: xe-2447-89042e0bb417f4d67280e1d7fa9bbcca51734571 -> xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5

  IGTPW_12398: bf13da2a3201323521295aa183f36e8841b344b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2447-89042e0bb417f4d67280e1d7fa9bbcca51734571: 89042e0bb417f4d67280e1d7fa9bbcca51734571
  xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5: 8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/index.html

--===============5478362599428816959==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/8] lib/xe/xe_gt: Fix header guards and boilerplate</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143204/">https://patchwork.freedesktop.org/series/143204/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8179_full -&gt; XEIGTPW_12398_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12398_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +147 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@xe_eudebug_online@resume-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +268 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@core_getversion@all-cards.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@fbdev@write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_atomic@plane-invalid-params-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> +101 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_exec_compute_mode@many-userptr-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_exec_compute_mode@many-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-4/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_query@query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_query@query-uc-fw-version-huc.html">PASS</a> +198 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-color:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_histogram@algo-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_histogram@algo-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3897">Intel XE#3897</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_exec_fault_mode@once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_exec_fault_mode@once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12398/shard-dg2-435/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8179 -&gt; IGTPW_12398</li>
<li>Linux: xe-2447-89042e0bb417f4d67280e1d7fa9bbcca51734571 -&gt; xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5</li>
</ul>
<p>IGTPW_12398: bf13da2a3201323521295aa183f36e8841b344b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2447-89042e0bb417f4d67280e1d7fa9bbcca51734571: 89042e0bb417f4d67280e1d7fa9bbcca51734571<br />
  xe-2452-8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5: 8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5</p>

</body>
</html>

--===============5478362599428816959==--
