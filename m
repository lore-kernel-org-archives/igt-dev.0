Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9CCCCF9F8
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 20:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838C610EB7B;
	Fri,  7 Nov 2025 20:30:52 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194B810EB7A;
 Fri,  7 Nov 2025 20:30:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8823449139402993415=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5Bi-?=
 =?utf-8?q?g-t=2Cv4=2C1/2=5D_lib/ioct=5Fwrappers=3A_add_=5F=5Fprime=5Ffd=5Ft?=
 =?utf-8?q?o=5Fhandle=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Nov 2025 20:30:52 -0000
Message-ID: <176254745209.29335.3110602815688934920@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251106121831.150128-3-matthew.auld@intel.com>
In-Reply-To: <20251106121831.150128-3-matthew.auld@intel.com>
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

--===============8823449139402993415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v4,1/2] lib/ioct_wrappers: add __prime_fd_to_handle()
URL   : https://patchwork.freedesktop.org/series/157151/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8613_FULL -> XEIGTPW_14014_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14014_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14014_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14014_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@panthor/panthor_group@group_submit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-435/igt@panthor/panthor_group@group_submit.html

  
#### Warnings ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     [FAIL][4] ([Intel XE#1173]) -> [SKIP][5] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14014_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1125])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +4 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#367]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#2907])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#787]) +55 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#3432])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][22] -> [INCOMPLETE][23] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#306])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-1/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#373]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#373])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2252]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][30] ([Intel XE#1178]) +2 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-463/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#1178]) +2 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#3304])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1188])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2321])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#308])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#309])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2291]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2291])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#4302])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#1340])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#4494] / [i915#3804])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2316])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1421]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2316]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1401] / [Intel XE#1745])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1401])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2293] / [Intel XE#2380])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2293])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#651]) +16 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#5390]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2311]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#651])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#6312]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#653]) +16 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#656]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2312]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2313]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#3374] / [Intel XE#3544])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#455]) +12 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2763]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#718])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1406] / [Intel XE#2893]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1406])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-4/igt@kms_psr@pr-basic.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#3414]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#3414] / [Intel XE#3904])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#1435])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-strength:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#6503])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@kms_sharpness_filter@filter-strength.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#330])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#4227]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-lnl-1/igt@kms_vrr@flipline.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-4/igt@kms_vrr@flipline.html

  * igt@panthor/panthor_group@group_submit:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#6530])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-4/igt@panthor/panthor_group@group_submit.html
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#6530])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@panthor/panthor_group@group_submit.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [FAIL][82] ([Intel XE#5794])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#6360])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many-all-ram.html

  * igt@xe_copy_basic@mem-page-copy-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#5300])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-436/igt@xe_copy_basic@mem-page-copy-1.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1126])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#4837]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#4837]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-436/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#4837])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-1/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#688]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-3/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2322]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#288]) +14 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2360])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][93] ([Intel XE#6299])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-435/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#5625])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#4915]) +171 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#4943]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#4943]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race:
    - shard-bmg:          [PASS][99] -> [INCOMPLETE][100] ([Intel XE#6480])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2229])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#6377])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@xe_oa@non-zero-reason-all.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#3573]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1061])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-1/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2284] / [Intel XE#366])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [PASS][106] -> [FAIL][107] ([Intel XE#6251]) +1 other test fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#4733])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#4733]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-433/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#944]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@xe_query@multigpu-query-engines.html
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#944])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-8/igt@xe_query@multigpu-query-engines.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4814])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@xe_render_copy@render-stress-0-copies.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][113] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][115] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][117] ([Intel XE#6014] / [Intel XE#6168]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][119] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][121] ([Intel XE#2291]) -> [PASS][122] +1 other test pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][123] ([Intel XE#1475]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][125] ([Intel XE#5299]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][127] ([Intel XE#2316]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][129] ([Intel XE#301]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][131] ([Intel XE#6321]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [DMESG-WARN][133] ([Intel XE#6481]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [SKIP][157], [PASS][158], [PASS][159]) ([Intel XE#2457]) -> ([PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-4/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-8/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-4/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-8/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-4/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-1/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-2/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-1/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-1/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-5/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-5/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-5/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-7/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-7/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-7/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-8/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-7/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-7/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-2/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-8/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-8/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-5/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-5/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][180] ([Intel XE#1173]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-dg2-464/igt@xe_peer2peer@read.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@xe_peer2peer@read.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
    - shard-lnl:          [FAIL][182] ([Intel XE#6251]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html

  * igt@xe_pmu@gt-c6-idle:
    - shard-dg2-set2:     [FAIL][184] ([Intel XE#6366]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-dg2-466/igt@xe_pmu@gt-c6-idle.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@xe_pmu@gt-c6-idle.html

  
#### Warnings ####

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][186] ([Intel XE#2341]) -> [FAIL][187] ([Intel XE#1178])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@kms_content_protection@srm.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][188] ([Intel XE#2341]) -> [FAIL][189] ([Intel XE#1188])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@kms_content_protection@uevent.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [FAIL][190] ([Intel XE#3098]) -> [SKIP][191] ([Intel XE#2316])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][192] ([Intel XE#2311]) -> [SKIP][193] ([Intel XE#2312]) +12 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][194] ([Intel XE#2312]) -> [SKIP][195] ([Intel XE#5390]) +5 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][196] ([Intel XE#5390]) -> [SKIP][197] ([Intel XE#2312]) +6 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][198] ([Intel XE#2312]) -> [SKIP][199] ([Intel XE#2311]) +14 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][200] ([Intel XE#2313]) -> [SKIP][201] ([Intel XE#2312]) +9 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][202] ([Intel XE#2312]) -> [SKIP][203] ([Intel XE#2313]) +7 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][204] ([Intel XE#4596]) -> [SKIP][205] ([Intel XE#5021])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][206] ([Intel XE#5862]) -> [FAIL][207] ([Intel XE#2142]) +1 other test fail
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5794
  [Intel XE#5862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5862
  [Intel XE#6014]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6299
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#6366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6366
  [Intel XE#6377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6377
  [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
  [Intel XE#6481]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6481
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#6530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6530
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8613 -> IGTPW_14014
  * Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -> xe-4060-9deffe4baace482f9414f36f53f3385868533fd6

  IGTPW_14014: 14014
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad
  xe-4060-9deffe4baace482f9414f36f53f3385868533fd6: 9deffe4baace482f9414f36f53f3385868533fd6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/index.html

--===============8823449139402993415==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v4,1/2] lib/ioct=
_wrappers: add __prime_fd_to_handle()</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/157151/">https://patchwork.freedesktop.org/series/157151/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14014/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14014/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8613_FULL -&gt; XEIGTPW_14014_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14014_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_14014_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14=
014_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-256x85.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1401=
4/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x85.html">INCOMPLETE</=
a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_group@group_submit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-435/igt@panthor/panthor_group@group_su=
bmit.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system=
-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14014_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-2/igt@intel_hwmon@hwmon-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125=
">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotat=
e-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14014/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1=
920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@kms_bw@linear-tiling-1-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basi=
c-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14014/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#=
4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-c-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14014/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-1/igt@kms_chamelium_color@ctm-0-25.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-cha=
nge-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-chang=
e-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-stres=
s-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-463/igt@kms_content_protection@lic-typ=
e-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-8/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-463/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@kms_content_protection@uevent@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-8/igt@kms_cursor_legacy@2x-long-cursor=
-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014=
/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4=
302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6b=
pc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-3/igt@kms_flip@2x-nonexisting-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/sh=
ard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-=
1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-=
pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-stridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcps=
r-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests sk=
ip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-4/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-p=
lane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_psr@fbc-psr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-4/igt@kms_psr@pr-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel=
 XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3414">Intel XE#3414</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-8/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014=
/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1=
435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@kms_sharpness_filter@filter-stre=
ngth.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-7/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-lnl-1/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-4/igt@kms_=
vrr@flipline.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4227">Intel XE#4227</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_group@group_submit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-4/igt@panthor/panthor_group@group_subm=
it.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6530">Intel XE#6530</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@panthor/panthor_group@group_subm=
it.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6530">Intel XE#6530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/57=
94">Intel XE#5794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-433/igt@xe_compute_preempt@compute-pre=
empt-many-all-ram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6360">Intel XE#6360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-page-copy-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-436/igt@xe_copy_basic@mem-page-copy-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5300">Intel XE#5300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@xe_eudebug@basic-vm-bind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/483=
7">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-436/igt@xe_eudebug_online@debugger-reo=
pen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-1/igt@xe_eudebug_online@interrupt-all-=
set-breakpoint-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-3/igt@xe_evict@evict-large-external.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@xe_exec_fault_mode@once-bindex=
ecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-=
batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-435/igt@xe_exec_reset@long-spin-comp-r=
euse-many-preempt-threads.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6299">Intel XE#6299</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-single-vma.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14014/shard-lnl-2/igt@xe_exec_system_allocator@pat-in=
dex-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@xe_exec_system_allocator@proce=
ss-many-stride-mmap-prefetch-shared.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +171 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@xe_exec_system_allocator@threads=
-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE=
#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-7/igt@xe_exec_system_allocator@threads=
-shared-vm-many-large-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-=
stride-free-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14014/shard-bmg-8/igt@xe_exec_system_allocator@thread=
s-shared-vm-many-stride-free-race.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6480">Intel XE#6480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_va=
lidate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@xe_oa@non-zero-reason-all.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6377">Intel XE#6377</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-1/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Int=
el XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_comput=
e0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe=
_engine_class_compute0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-3/igt@xe_pmu@engine-activity-ac=
curacy-90@engine-drm_xe_engine_class_compute0.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) =
+1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-433/igt@xe_pxp@pxp-termination-key-upd=
ate-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt@xe_query@multigpu-query-engine=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-lnl-8/igt@xe_query@multigpu-query-engines.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14014/shard-dg2-466/igt@xe_render_copy@render-stress-0=
-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@kms_bw@connecte=
d-linear-tiling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/sh=
ard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6014">Intel XE#6014</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-464/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-dg2-464/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14014/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb=
-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1475">Intel XE#1475</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-curs=
or-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299=
">Intel XE#5299</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14014/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel X=
E#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14014/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14014/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6321">Intel XE#6321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14014/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-=
threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6481">Intel XE=
#6481</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14014/shard-bmg-4/igt@xe_gt_freq@freq_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8613/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8613/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8613/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8613/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8613/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8613/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8613/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard=
-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-5/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
613/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8613/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-7/igt@xe_module_loa=
d@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8613/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
014/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14014/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14014/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14014/shard-bmg-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14014/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14014/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14014/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14014/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-dg2-464/igt@xe_peer2peer@read.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/sha=
rd-dg2-464/igt@xe_peer2peer@read.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_=
enhance0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe=
_engine_class_video_enhance0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-lnl-3/igt@xe_pm=
u@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-c6-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-dg2-466/igt@xe_pmu@gt-c6-idle.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6366">Intel XE#6366</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/sha=
rd-dg2-466/igt@xe_pmu@gt-c6-idle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#23=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
014/shard-bmg-1/igt@kms_content_protection@srm.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14014/shard-bmg-7/igt@kms_content_protection@uevent.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#118=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3098">Intel XE#3098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14014/shard-bmg-7/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14014/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5=
021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8613/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5862">Intel XE#5862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14014/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual=
@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8613 -&gt; IGTPW_14014</li>
<li>Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -&gt; xe-4060-9=
deffe4baace482f9414f36f53f3385868533fd6</li>
</ul>
<p>IGTPW_14014: 14014<br />
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc9=
61a713223d488d6ad<br />
  xe-4060-9deffe4baace482f9414f36f53f3385868533fd6: 9deffe4baace482f9414f36=
f53f3385868533fd6</p>

</body>
</html>

--===============8823449139402993415==--
