Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2BAC87FC9
	for <igt-dev@archiver.kernel.org>; Tue, 29 Jul 2025 21:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC5E10E04F;
	Tue, 29 Jul 2025 21:26:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8086F10E04F;
 Tue, 29 Jul 2025 21:26:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7927371111609521205=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fpmu=3A_Sk?=
 =?utf-8?q?ip_tests_involving_engine_activity_on_vm_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 29 Jul 2025 21:26:26 -0000
Message-ID: <175382438637.197651.2166154716979213588@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729101349.3208545-1-soham.purkait@intel.com>
In-Reply-To: <20250729101349.3208545-1-soham.purkait@intel.com>
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

--===============7927371111609521205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pmu: Skip tests involving engine activity on vm (rev2)
URL   : https://patchwork.freedesktop.org/series/151605/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8478_FULL -> XEIGTPW_13537_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13537_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13537_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13537_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_multiple@tiling-4@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-dg2-463/igt@kms_plane_multiple@tiling-4@pipe-a-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@kms_plane_multiple@tiling-4@pipe-a-dp-4.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13537_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#4963]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@core_hotunplug@hotrebind-lateclose.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#2134]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-3/igt@fbdev@nullptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@fbdev@nullptr.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#4665])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@intel_hwmon@hwmon-write.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#4950]) +86 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_addfb_basic@bad-pitch-999.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#827])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2327])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#316])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#4947]) +16 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1124]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2191])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2191]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#787]) +111 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-2/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][26] ([Intel XE#3862])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2907])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][28] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#4417]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#373]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-1/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#373]) +6 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1178]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1178])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-435/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#3304])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2341]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#3278])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-4/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2320])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1424])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][40] -> [DMESG-WARN][41] ([Intel XE#5354])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2291]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#323])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#323])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#776])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#776])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1421]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2316]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#301]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][53] ([Intel XE#2049] / [Intel XE#2597])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1401] / [Intel XE#1745])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1401])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2380])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2293]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#651]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2311]) +7 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#5390]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#656]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#651]) +14 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#658])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2313]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2312])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#653]) +8 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#4950]) +8 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#455]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-435/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#1503]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4090])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2925])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2763]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#870])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-435/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#718])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1131])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2499])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#4962])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-2/igt@kms_pm_rpm@legacy-planes-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#4608])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#4947]) +16 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1489]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1489])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2939])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-lnl:          [PASS][88] -> [SKIP][89] ([Intel XE#4692])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#3414])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#3414] / [Intel XE#3904])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2426])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1499])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_vrr@flip-suspend.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#5249])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-466/igt@xe_configfs@survivability-mode.html
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#5249])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-2/igt@xe_configfs@survivability-mode.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#4837])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#4837]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-463/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4837]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2322]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [PASS][100] -> [SKIP][101] ([Intel XE#1392])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1392]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#288]) +11 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_system_allocator@process-many-free-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#4915]) +76 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-433/igt@xe_exec_system_allocator@process-many-free-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#4943]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-5/igt@xe_exec_system_allocator@process-many-stride-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#4943]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][107] -> [FAIL][108] ([Intel XE#5018])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][109] -> [DMESG-WARN][110] ([Intel XE#3876])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][111] -> [SKIP][112] ([Intel XE#4945]) +385 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#255])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][114] -> [ABORT][115] ([Intel XE#5087])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@xe_module_load@reload-no-display.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#3573]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#4733])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@xe_pxp@pxp-optout.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#4945]) +31 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#4733]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#944])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@xe_query@multigpu-query-gt-list.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#944])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#944])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-2/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#4351])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [SKIP][124] ([Intel XE#4963]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@core_hotunplug@hotreplug.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][126] ([Intel XE#4674]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-bmg:          [SKIP][128] ([Intel XE#2134]) -> [PASS][129] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@fbdev@info.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@fbdev@info.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [SKIP][130] -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@intel_hwmon@hwmon-read.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][132] ([Intel XE#4947]) -> [PASS][133] +15 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][134] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][136] ([Intel XE#3862]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][138] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][140] ([Intel XE#2291]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][142] ([Intel XE#1340]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][144] ([Intel XE#4294]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][146] ([Intel XE#2316]) -> [PASS][147] +6 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][148] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][150] ([Intel XE#1503]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_hdr@static-toggle.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][152] ([Intel XE#718]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][154] ([Intel XE#4962]) -> [PASS][155] +2 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_pm_rpm@i2c.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_pm_rpm@i2c.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [SKIP][156] ([Intel XE#4950]) -> [PASS][157] +79 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_sequence@get-idle.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_sequence@get-idle.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][158] ([Intel XE#1435]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1392]) -> [PASS][161] +4 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [SKIP][162] ([Intel XE#4945]) -> [PASS][163] +410 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@xe_spin_batch@spin-all.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@xe_spin_batch@spin-all.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [SKIP][164] ([Intel XE#4950]) -> [FAIL][165] ([Intel XE#827])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][166] ([Intel XE#873]) -> [SKIP][167] ([Intel XE#4950])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][168] ([Intel XE#4947]) -> [SKIP][169] ([Intel XE#2327]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][170] ([Intel XE#2327]) -> [SKIP][171] ([Intel XE#4947]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][172] ([Intel XE#4947]) -> [SKIP][173] ([Intel XE#1124]) +8 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][174] ([Intel XE#1124]) -> [SKIP][175] ([Intel XE#4947]) +8 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][176] ([Intel XE#4947]) -> [SKIP][177] ([Intel XE#610])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][178] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][179] ([Intel XE#4950])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][180] ([Intel XE#4950]) -> [SKIP][181] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][182] ([Intel XE#4950]) -> [SKIP][183] ([Intel XE#367]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][184] ([Intel XE#367]) -> [SKIP][185] ([Intel XE#4950]) +3 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][186] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][187] ([Intel XE#4947])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][188] ([Intel XE#2887]) -> [SKIP][189] ([Intel XE#4947]) +15 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][190] ([Intel XE#4947]) -> [SKIP][191] ([Intel XE#2652] / [Intel XE#787])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][192] ([Intel XE#4947]) -> [INCOMPLETE][193] ([Intel XE#3862])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][194] ([Intel XE#3432]) -> [SKIP][195] ([Intel XE#4947])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][196] ([Intel XE#4947]) -> [SKIP][197] ([Intel XE#3432]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][198] ([Intel XE#4947]) -> [SKIP][199] ([Intel XE#2887]) +13 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][200] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][201] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][202] ([Intel XE#4947]) -> [SKIP][203] ([Intel XE#2724])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][204] ([Intel XE#2724]) -> [SKIP][205] ([Intel XE#4947]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_cdclk@plane-scaling.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][206] ([Intel XE#4950]) -> [SKIP][207] ([Intel XE#2325]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][208] ([Intel XE#2325]) -> [SKIP][209] ([Intel XE#4950])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][210] ([Intel XE#2252]) -> [SKIP][211] ([Intel XE#4950]) +6 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][212] ([Intel XE#4950]) -> [SKIP][213] ([Intel XE#2252]) +9 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][214] ([Intel XE#2341]) -> [FAIL][215] ([Intel XE#1178]) +1 other test fail
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@kms_content_protection@atomic.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][216] ([Intel XE#4950]) -> [SKIP][217] ([Intel XE#2341]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_content_protection@content-type-change.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][218] ([Intel XE#2390]) -> [SKIP][219] ([Intel XE#4950])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][220] ([Intel XE#4950]) -> [SKIP][221] ([Intel XE#2390])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][222] ([Intel XE#1188]) -> [SKIP][223] ([Intel XE#4950])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-2/igt@kms_content_protection@uevent.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][224] ([Intel XE#4950]) -> [SKIP][225] ([Intel XE#2320]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][226] ([Intel XE#2321]) -> [SKIP][227] ([Intel XE#4950]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][228] ([Intel XE#4950]) -> [SKIP][229] ([Intel XE#2321]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          [SKIP][230] ([Intel XE#2320]) -> [SKIP][231] ([Intel XE#4950]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][232] ([Intel XE#4950]) -> [SKIP][233] ([Intel XE#2286]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][234] ([Intel XE#4947]) -> [SKIP][235] ([Intel XE#4354])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][236] ([Intel XE#4947]) -> [SKIP][237] ([Intel XE#2244])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][238] ([Intel XE#2244]) -> [SKIP][239] ([Intel XE#4947])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][240] ([Intel XE#4422]) -> [SKIP][241] ([Intel XE#4945])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][242] ([Intel XE#4947]) -> [SKIP][243] ([Intel XE#776])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_fbcon_fbt@psr.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][244] ([Intel XE#2375]) -> [SKIP][245] ([Intel XE#4950])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][246] ([Intel XE#2374]) -> [SKIP][247] ([Intel XE#4950])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-2/igt@kms_feature_discovery@psr1.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][248] ([Intel XE#4950]) -> [SKIP][249] ([Intel XE#2374])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][250] ([Intel XE#4950]) -> [SKIP][251] ([Intel XE#2316]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [SKIP][252] ([Intel XE#4950]) -> [INCOMPLETE][253] ([Intel XE#2049] / [Intel XE#2597])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][254] ([Intel XE#4947]) -> [SKIP][255] ([Intel XE#2293] / [Intel XE#2380]) +7 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][256] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][257] ([Intel XE#4947]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][258] ([Intel XE#4947]) -> [SKIP][259] ([Intel XE#2380])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][260] ([Intel XE#2312]) -> [SKIP][261] ([Intel XE#2311]) +7 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][262] ([Intel XE#4947]) -> [SKIP][263] ([Intel XE#2312]) +5 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][264] ([Intel XE#2311]) -> [SKIP][265] ([Intel XE#2312]) +5 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][266] ([Intel XE#2311]) -> [SKIP][267] ([Intel XE#4947]) +27 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][268] ([Intel XE#4947]) -> [SKIP][269] ([Intel XE#2311]) +25 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][270] ([Intel XE#4947]) -> [SKIP][271] ([Intel XE#5390]) +8 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][272] ([Intel XE#2312]) -> [SKIP][273] ([Intel XE#5390]) +6 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][274] ([Intel XE#5390]) -> [SKIP][275] ([Intel XE#2312]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [SKIP][276] ([Intel XE#5427]) -> [SKIP][277] ([Intel XE#4947])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][278] ([Intel XE#5390]) -> [SKIP][279] ([Intel XE#4947]) +6 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][280] ([Intel XE#2312]) -> [SKIP][281] ([Intel XE#4947]) +9 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][282] ([Intel XE#4947]) -> [SKIP][283] ([Intel XE#2352])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][284] ([Intel XE#2312]) -> [SKIP][285] ([Intel XE#2313]) +9 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][286] ([Intel XE#4947]) -> [SKIP][287] ([Intel XE#2313]) +26 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][288] ([Intel XE#2313]) -> [SKIP][289] ([Intel XE#2312]) +4 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][290] ([Intel XE#4947]) -> [SKIP][291] ([Intel XE#5672])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][292] ([Intel XE#2313]) -> [SKIP][293] ([Intel XE#4947]) +23 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][294] ([Intel XE#4950]) -> [SKIP][295] ([Intel XE#3374] / [Intel XE#3544])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][296] ([Intel XE#2934]) -> [SKIP][297] ([Intel XE#4947])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][298] ([Intel XE#4947]) -> [SKIP][299] ([Intel XE#2927])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][300] ([Intel XE#2393]) -> [SKIP][301] ([Intel XE#4950])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][302] ([Intel XE#4950]) -> [SKIP][303] ([Intel XE#4596])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][304] ([Intel XE#4950]) -> [SKIP][305] ([Intel XE#5021])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][306] ([Intel XE#5020]) -> [SKIP][307] ([Intel XE#4950])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][308] ([Intel XE#4950]) -> [SKIP][309] ([Intel XE#2763]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][310] ([Intel XE#870]) -> [SKIP][311] ([Intel XE#4947]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][312] ([Intel XE#4947]) -> [SKIP][313] ([Intel XE#2391])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][314] ([Intel XE#2392]) -> [SKIP][315] ([Intel XE#4947])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][316] ([Intel XE#4947]) -> [SKIP][317] ([Intel XE#2392])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][318] ([Intel XE#4947]) -> [SKIP][319] ([Intel XE#2505])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][320] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][321] ([Intel XE#4962]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][322] ([Intel XE#1489]) -> [SKIP][323] ([Intel XE#4947]) +8 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][324] ([Intel XE#4947]) -> [SKIP][325] ([Intel XE#1489]) +5 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][326] ([Intel XE#4947]) -> [SKIP][327] ([Intel XE#2387]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][328] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][329] ([Intel XE#4947]) +13 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][330] ([Intel XE#4947]) -> [SKIP][331] ([Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][332] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][333] ([Intel XE#4950])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][334] ([Intel XE#2330]) -> [SKIP][335] ([Intel XE#4950]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][336] ([Intel XE#4950]) -> [SKIP][337] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][338] ([Intel XE#4950]) -> [SKIP][339] ([Intel XE#2413]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][340] ([Intel XE#4950]) -> [SKIP][341] ([Intel XE#1435])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][342] ([Intel XE#4950]) -> [SKIP][343] ([Intel XE#2450])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][344] ([Intel XE#4950]) -> [SKIP][345] ([Intel XE#1499]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@kms_vrr@max-min.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][346] ([Intel XE#1499]) -> [SKIP][347] ([Intel XE#4950])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][348] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][349] ([Intel XE#4950])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-8/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          [SKIP][350] ([Intel XE#4837]) -> [SKIP][351] ([Intel XE#4945]) +12 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@xe_eudebug@basic-read-event.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][352] ([Intel XE#4945]) -> [SKIP][353] ([Intel XE#4837]) +13 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][354] ([Intel XE#4945]) -> [SKIP][355] ([Intel XE#2322]) +8 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][356] ([Intel XE#2322]) -> [SKIP][357] ([Intel XE#4945]) +6 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][358] ([Intel XE#4943]) -> [SKIP][359] ([Intel XE#4945]) +24 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
    - shard-bmg:          [SKIP][360] ([Intel XE#4945]) -> [SKIP][361] ([Intel XE#4943]) +22 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][362] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [SKIP][363] ([Intel XE#4945])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][364] ([Intel XE#2245]) -> [SKIP][365] ([Intel XE#4945])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][366] ([Intel XE#2236]) -> [SKIP][367] ([Intel XE#4945])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][368] ([Intel XE#4945]) -> [SKIP][369] ([Intel XE#2284])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][370] ([Intel XE#2284]) -> [SKIP][371] ([Intel XE#4945])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@xe_pm@d3cold-multiple-execs.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-bmg:          [SKIP][372] ([Intel XE#4650]) -> [SKIP][373] ([Intel XE#4945])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-2/igt@xe_pmu@all-fn-engine-activity-load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][374] ([Intel XE#4945]) -> [SKIP][375] ([Intel XE#4733]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][376] ([Intel XE#4733]) -> [SKIP][377] ([Intel XE#4945]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][378] ([Intel XE#944]) -> [SKIP][379] ([Intel XE#4945])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][380] ([Intel XE#4945]) -> [SKIP][381] ([Intel XE#944]) +4 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][382] ([Intel XE#4945]) -> [SKIP][383] ([Intel XE#4130]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-bmg:          [SKIP][384] ([Intel XE#4130]) -> [SKIP][385] ([Intel XE#4945])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          [SKIP][386] ([Intel XE#4351]) -> [SKIP][387] ([Intel XE#4945])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8478/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5087]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087
  [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8478 -> IGTPW_13537

  IGTPW_13537: c76c0b7ddea549ded2b564009f42d9a841bb7b20 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6: c2d04724123c8df9ecec874f1db3007540c264e6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/index.html

--===============7927371111609521205==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pmu: Skip tests involving eng=
ine activity on vm (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151605/">https://patchwork.freedesktop.org/series/151605/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13537/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13537/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8478_FULL -&gt; XEIGTPW_13537_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13537_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13537_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
537_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_multiple@tiling-4@pipe-a-dp-4:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-dg2-463/igt@kms_plane_multiple@tiling-4@pipe-a-dp-4.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3537/shard-dg2-434/igt@kms_plane_multiple@tiling-4@pipe-a-dp-4.html">INCOMP=
LETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13537_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/sh=
ard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-3/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@fbdev@n=
ullptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/i=
gt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-b=
mg-5/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +86 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_async_flips@alternate-sync-a=
sync-flip@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/sha=
rd-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)=
 +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@kms_bw@connected-linear-tiling=
-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other te=
st skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-til=
ed-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +111 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-2/igt@kms_ccs@bad-pixel-format-yf-tile=
d-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_ccs@bad-pixel-format-yf-tile=
d-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">In=
tel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe=
-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-1/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for=
-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-435/igt@kms_content_protection@atomic@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-466/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-4/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3537/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-433/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-5/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
6">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-7/igt@kms_flip@2x-flip-vs-expired-vbla=
nk.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13537/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-=
a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel X=
E#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-=
pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdr=
rs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcps=
r-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-=
pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_hdr@bpc-switch-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950=
">Intel XE#4950</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-435/igt@kms_hdr@brightness-with-hdr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@k=
ms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-2/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-435/igt@kms_pm_backlight@basic-brightn=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-3/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-negative.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">I=
ntel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-2/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-b=
mg-5/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +16 other tests=
 skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_psr@psr-cursor-plane-onoff.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-463/igt@kms_psr_stress_test@invalidate=
-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13537/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4692">Intel XE#4692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@kms_rotation_crc@primary-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-7/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-466/igt@xe_configfs@survivability-mode=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5249">Intel XE#5249</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-2/igt@xe_configfs@survivability-mode.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5249">Intel XE#5249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-ufence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-463/igt@xe_eudebug@vma-ufence-faultabl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@xe_eudebug_online@interrupt-othe=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-b=
asic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-rebind.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13537/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bind=
execqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@xe_exec_fault_mode@many-execqu=
eues-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-433/igt@xe_exec_system_allocator@proce=
ss-many-free-race-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +76 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-5/igt@xe_exec_system_allocator@process=
-many-stride-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@xe_exec_system_allocator@threads=
-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-new-bo-map-nomemset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13537/shard-lnl-8/igt@xe_exec_system_allocat=
or@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-rebind=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13537/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebin=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-x=
e_ggtt_init_early.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_fault_injection@inject-faul=
t-probe-function-xe_ggtt_init_early.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +385 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">=
Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@xe_module_load@reload-no-display.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shar=
d-bmg-4/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5087">Intel XE#5087</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-bu=
ffer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@xe_pxp@pxp-optout.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Inte=
l XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-te=
rmination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4945">Intel XE#4945</a>) +31 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-=
termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@xe_query@multigpu-query-gt-list.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-466/igt@xe_query@multigpu-query-gt-lis=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-lnl-2/igt@xe_query@multigpu-query-gt-list.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-dg2-464/igt@xe_sriov_scheduling@equal-thro=
ughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1353=
7/shard-bmg-8/igt@core_hotunplug@hotreplug.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674">In=
tel XE#4674</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13537/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@fbdev@info.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/=
igt@fbdev@info.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/ig=
t@intel_hwmon@hwmon-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-18=
0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_big_fb@4-ti=
led-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> +15 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_bw@connecte=
d-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3862">Intel XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-dg2-mc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4522">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13537/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-=
rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13537/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legac=
y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel=
 XE#1340</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13537/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">=
Intel XE#4294</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13537/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13537/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</=
a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"=
>Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13537/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-=
dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/s=
hard-bmg-3/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-=
lnl-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bm=
g-3/igt@kms_pm_rpm@i2c.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_sequence@get-idle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/s=
hard-bmg-3/igt@kms_sequence@get-idle.html">PASS</a> +79 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel=
 XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13537/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-u=
serptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-dg2-434/igt@xe_exec_basic@mult=
igpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a> +4 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1353=
7/shard-bmg-4/igt@xe_spin_batch@spin-all.html">PASS</a> +410 other tests pa=
ss</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
50">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13537/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-fli=
p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Inte=
l XE#873</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13537/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Inte=
l XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Int=
el XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13537/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">In=
tel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">In=
tel XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13537/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">=
Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Inte=
l XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13537/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-=
stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947=
">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13537/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_bw@connecte=
d-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2=
160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13537/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-1920x10=
80p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13537/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4950">Intel XE#4950</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/26=
52">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-=
tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13537/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bm=
g-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled=
-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-c=
cs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13537/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel =
XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4522">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13537/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg=
2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE=
#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">=
Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13537/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
24">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1353=
7/shard-bmg-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#=
4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13537/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#=
2325</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13537/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hiberna=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-chan=
ge-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13537/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-l=
ist.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13537/shard-bmg-4/igt@kms_content_protection@atomic.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_content_protection@content-type-change.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13537/shard-bmg-6/igt@kms_content_protection@content-type-cha=
nge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">I=
ntel XE#2390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13537/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950=
">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">I=
ntel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13537/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390=
">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-2/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13537/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#495=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950"=
>Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13537/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"=
>Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13537/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">I=
ntel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13537/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321=
">Intel XE#2321</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">In=
tel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13537/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">=
Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13537/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#435=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">In=
tel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13537/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">=
Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1353=
7/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visib=
le-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4422">Intel XE#4422</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dir=
ty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard=
-bmg-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#=
2375</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13537/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#23=
74</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
537/shard-bmg-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#49=
50</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
537/shard-bmg-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950=
">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13537/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1353=
7/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">In=
tel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bp=
p-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_flip_scaled=
_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380"=
>Intel XE#2380</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_=
flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel=
 XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4t=
iledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-2/igt@kms_flip_s=
caled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Int=
el XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>=
) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb=
565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_frontbuffer_tracking=
@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427">In=
tel XE#5427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13537/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">=
Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#49=
47</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
47">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13537/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">=
Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13537/shard-bmg-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/56=
72">Intel XE#5672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_frontbuffer_tracki=
ng@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +23 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4=
950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3537/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2934">Intel XE#2934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ult=
ra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947=
">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13537/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#23=
93</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
537/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel X=
E#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13537/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4=
596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel =
XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13537/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE=
#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5=
020</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3537/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_plane_scali=
ng@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel X=
E#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13537/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel X=
E#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13537/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2=
391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard=
-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard=
-bmg-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/sha=
rd-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141"=
>Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/496=
2">Intel XE#4962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-=
sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13537/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#49=
47</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
537/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Int=
el XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4947">Intel XE#4947</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13537/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#223=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">I=
ntel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3904">Intel XE#3904</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_rotation_crc@primary-rotati=
on-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2330">Intel XE#2330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13537/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-refl=
ect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13537/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-=
pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">=
Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13537/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
13">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">In=
tel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13537/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel X=
E#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13537/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2=
450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-b=
mg-4/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13537/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">In=
tel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-8/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">I=
ntel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2849">Intel XE#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprob=
e-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4=
837</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3537/shard-bmg-5/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13537/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint-=
sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4837">Intel XE#4837</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-b=
indexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-4/i=
gt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-inv=
alidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userpt=
r-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_exec_basic@multigp=
u-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-mmap-new-h=
uge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_exec_system_alloca=
tor@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +24 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-6/igt@x=
e_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-h=
uge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4943">Intel XE#4943</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send=
_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt=
@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4=
945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-7/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/s=
hard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1353=
7/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1353=
7/shard-bmg-2/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2=
284</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3537/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-2/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Int=
el XE#4650</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13537/shard-bmg-5/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">In=
tel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/s=
hard-bmg-6/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4733">Intel XE#4733</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termin=
ation-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/94=
4">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13537/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
45">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13537/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extensio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13537/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-r=
anges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovisio=
n-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13537/shard-bmg-5/igt@xe_sriov_auto_prov=
isioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8478/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">I=
ntel XE#4351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13537/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945=
">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8478 -&gt; IGTPW_13537</li>
</ul>
<p>IGTPW_13537: c76c0b7ddea549ded2b564009f42d9a841bb7b20 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3484-c2d04724123c8df9ecec874f1db3007540c264e6: c2d04724123c8df9ecec874=
f1db3007540c264e6</p>

</body>
</html>

--===============7927371111609521205==--
