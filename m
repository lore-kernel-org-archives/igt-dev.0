Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00F5CD4F3C
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 20:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D82010E0C6;
	Fri, 15 May 2026 20:23:17 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4B510E0C6;
 Fri, 15 May 2026 20:22:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0787886766395318528=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_tests/amdgpu=3A_Fix_queue_reset_monitor_logic_and_allow_-ETI?=
 =?utf-8?q?ME_in_CS_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 15 May 2026 20:22:59 -0000
Message-ID: <177887657970.75062.17180474257808210233@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260514235000.125069-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260514235000.125069-1-vitaly.prosyak@amd.com>
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

--===============0787886766395318528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] tests/amdgpu: Fix queue reset monitor logic and allow -ETIME in CS helper
URL   : https://patchwork.freedesktop.org/series/166608/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8912_FULL -> XEIGTPW_15187_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15187_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15187_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15187_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-lnl:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-3/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3:
    - shard-bmg:          [PASS][3] -> ([INCOMPLETE][4], [PASS][5])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-bmg:          NOTRUN -> ([INCOMPLETE][6], [PASS][7])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12:
    - shard-lnl:          [PASS][8] -> ([PASS][9], [DMESG-WARN][10]) +1 other test ( 1 dmesg-warn, 1 pass )
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-1/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-5/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15187_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][11] -> ([FAIL][12], [PASS][13]) ([Intel XE#3718] / [Intel XE#6078]) +2 other tests ( 1 fail, 1 pass )
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [PASS][14] -> ([FAIL][15], [PASS][16]) ([Intel XE#6078])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][17] -> ([PASS][18], [INCOMPLETE][19]) ([Intel XE#4912]) +1 other test ( 1 incomplete, 1 pass )
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> ([SKIP][20], [SKIP][21]) ([Intel XE#2370])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][22], [SKIP][23]) ([Intel XE#2327]) +1 other test ( 2 skip )
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> ([SKIP][24], [SKIP][25]) ([Intel XE#7059] / [Intel XE#7085])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1124])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> ([SKIP][29], [SKIP][30]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][31], [SKIP][32]) ([Intel XE#7679])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][33], [SKIP][34]) ([Intel XE#367])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][35], [SKIP][36]) ([Intel XE#2887]) +5 other tests ( 2 skip )
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> ([SKIP][37], [SKIP][38]) ([Intel XE#2325] / [Intel XE#7358])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_chamelium_color@ctm-max.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> ([SKIP][40], [SKIP][41]) ([Intel XE#2252]) +1 other test ( 2 skip )
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> ([FAIL][42], [FAIL][43]) ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test ( 2 fail )
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_content_protection@legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2320])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][45] -> ([FAIL][46], [FAIL][47]) ([Intel XE#7571])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> ([SKIP][48], [SKIP][49]) ([Intel XE#4331] / [Intel XE#7227])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> ([SKIP][50], [SKIP][51]) ([Intel XE#2244])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#2373] / [Intel XE#7448])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_feature_discovery@display-3x.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][54] -> ([PASS][55], [ABORT][56]) ([Intel XE#5545] / [Intel XE#6652] / [Intel XE#7814]) +1 other test ( 1 abort, 1 pass )
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_flip@2x-plain-flip.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][57] -> ([PASS][58], [FAIL][59]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][60] -> ([PASS][61], [FAIL][62]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 1 fail, 1 pass )
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          [PASS][63] -> ([PASS][64], [INCOMPLETE][65]) ([Intel XE#7933])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][66], [SKIP][67]) ([Intel XE#7178] / [Intel XE#7351]) +1 other test ( 2 skip )
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2311]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#4141]) +5 other tests ( 2 skip )
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][71], [SKIP][72]) ([Intel XE#656] / [Intel XE#7905]) +1 other test ( 2 skip )
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4141])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#656] / [Intel XE#7905])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][75], [SKIP][76]) ([Intel XE#7061] / [Intel XE#7356]) +1 other test ( 2 skip )
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:
    - shard-lnl:          NOTRUN -> ([SKIP][77], [SKIP][78]) ([Intel XE#6312] / [Intel XE#651])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([Intel XE#2311]) +25 other tests ( 2 skip )
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][81], [SKIP][82]) ([Intel XE#7061]) +1 other test ( 2 skip )
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][83], [SKIP][84]) ([Intel XE#6312])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][85], [SKIP][86]) ([Intel XE#2313]) +20 other tests ( 2 skip )
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2313]) +8 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> ([SKIP][88], [SKIP][89]) ([Intel XE#7905]) +2 other tests ( 2 skip )
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][90] -> ([PASS][91], [SKIP][92]) ([Intel XE#1503])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][93] -> ([PASS][94], [SKIP][95]) ([Intel XE#7922]) +1 other test ( 1 pass, 1 skip )
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][96] -> ([PASS][97], [SKIP][98]) ([Intel XE#7915]) +1 other test ( 1 pass, 1 skip )
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> ([SKIP][99], [SKIP][100]) ([Intel XE#2486])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_panel_fitting@atomic-fastset.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-bmg:          NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#7283]) +1 other test ( 2 skip )
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> ([SKIP][103], [SKIP][104]) ([Intel XE#7130]) +1 other test ( 2 skip )
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> ([SKIP][106], [SKIP][107]) ([Intel XE#2763] / [Intel XE#6886]) +7 other tests ( 2 skip )
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> ([SKIP][108], [SKIP][109]) ([Intel XE#2763] / [Intel XE#6886]) +3 other tests ( 2 skip )
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][110] -> ([FAIL][111], [FAIL][112]) ([Intel XE#7340])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][113], [SKIP][114]) ([Intel XE#2499])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][115], [SKIP][116]) ([Intel XE#1489]) +2 other tests ( 2 skip )
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#1489])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> ([SKIP][118], [SKIP][119]) ([Intel XE#2387] / [Intel XE#7429])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][120], [SKIP][121]) ([Intel XE#2234] / [Intel XE#2850]) +1 other test ( 2 skip )
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_psr@psr2-cursor-plane-onoff.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> ([SKIP][123], [SKIP][124]) ([Intel XE#7795])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> ([SKIP][125], [SKIP][126]) ([Intel XE#3904] / [Intel XE#7342])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          NOTRUN -> ([SKIP][128], [SKIP][129]) ([Intel XE#6503])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-scaler.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#1499])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_vrr@flip-basic.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-lnl:          NOTRUN -> ([SKIP][131], [SKIP][132]) ([Intel XE#7636]) +1 other test ( 2 skip )
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> ([SKIP][133], [SKIP][134]) ([Intel XE#7636]) +5 other tests ( 2 skip )
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@xe_eudebug_online@single-step-one.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          NOTRUN -> ([SKIP][135], [SKIP][136]) ([Intel XE#7140])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-priority.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_balancer@twice-parallel-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][137], [SKIP][138]) ([Intel XE#7482]) +1 other test ( 2 skip )
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@xe_exec_balancer@twice-parallel-basic.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@xe_exec_balancer@twice-parallel-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> ([SKIP][139], [SKIP][140]) ([Intel XE#2322] / [Intel XE#7372]) +4 other tests ( 2 skip )
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-lnl:          NOTRUN -> ([SKIP][141], [SKIP][142]) ([Intel XE#1392])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-1/igt@xe_exec_basic@multigpu-once-userptr-rebind.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-5/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-imm:
    - shard-bmg:          NOTRUN -> ([SKIP][143], [SKIP][144]) ([Intel XE#7136]) +2 other tests ( 2 skip )
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-imm.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@xe_exec_fault_mode@once-multi-queue-imm.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#7136]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem:
    - shard-lnl:          NOTRUN -> ([SKIP][146], [SKIP][147]) ([Intel XE#6874]) +2 other tests ( 2 skip )
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#6874]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> ([SKIP][149], [SKIP][150]) ([Intel XE#6874]) +10 other tests ( 2 skip )
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-priority.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-bmg:          NOTRUN -> ([SKIP][151], [SKIP][152]) ([Intel XE#7866])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-gt-reset.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-bmg:          NOTRUN -> ([SKIP][153], [SKIP][154]) ([Intel XE#7138]) +2 other tests ( 2 skip )
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-bmg:          NOTRUN -> ([SKIP][155], [SKIP][156]) ([Intel XE#6964])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#7793])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@xe_page_reclaim@binds-full-pd.html
    - shard-lnl:          NOTRUN -> ([SKIP][158], [SKIP][159]) ([Intel XE#7793])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-8/igt@xe_page_reclaim@binds-full-pd.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-7/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          NOTRUN -> ([SKIP][160], [SKIP][161]) ([Intel XE#7793])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@xe_page_reclaim@invalid-1g.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          NOTRUN -> ([FAIL][162], [FAIL][163]) ([Intel XE#7695])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@xe_pat@pat-sw-hw-compare.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> ([SKIP][164], [SKIP][165]) ([Intel XE#7599])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@xe_prefetch_fault@prefetch-fault-svm.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][166], [SKIP][167]) ([Intel XE#4733] / [Intel XE#7417]) +1 other test ( 2 skip )
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-lnl:          NOTRUN -> ([SKIP][168], [SKIP][169]) ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-5/igt@xe_sriov_vram@vf-access-after-resize-up.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@xe_sriov_vram@vf-access-after-resize-up.html

  * igt@xe_survivability@i2c-functionality:
    - shard-lnl:          NOTRUN -> ([SKIP][170], [SKIP][171]) ([Intel XE#6529] / [Intel XE#7331] / [Intel XE#7388])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@xe_survivability@i2c-functionality.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@xe_survivability@i2c-functionality.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][172] -> ([ABORT][173], [PASS][174]) ([Intel XE#7914])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_cursor_crc@cursor-size-hints:
    - shard-bmg:          [ABORT][175] ([Intel XE#5545] / [Intel XE#7814]) -> ([PASS][176], [PASS][177]) +1 other test ( 2 pass )
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-2/igt@kms_cursor_crc@cursor-size-hints.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_cursor_crc@cursor-size-hints.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_cursor_crc@cursor-size-hints.html

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][178] ([Intel XE#7774]) -> ([PASS][179], [PASS][180])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-2/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][181] ([Intel XE#3321]) -> ([PASS][182], [PASS][183]) +1 other test ( 2 pass )
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][184] -> ([PASS][185], [PASS][186]) +1 other test ( 2 pass )
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-8/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3.html

  * igt@xe_exec_basic@twice-userptr-rebind@rcs0:
    - shard-lnl:          [ABORT][187] -> ([PASS][188], [PASS][189]) +1 other test ( 2 pass )
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-5/igt@xe_exec_basic@twice-userptr-rebind@rcs0.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-3/igt@xe_exec_basic@twice-userptr-rebind@rcs0.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-8/igt@xe_exec_basic@twice-userptr-rebind@rcs0.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:
    - shard-lnl:          [FAIL][190] -> ([PASS][191], [PASS][192])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [FAIL][193] ([Intel XE#6569]) -> ([PASS][194], [PASS][195])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][196] ([Intel XE#3544] / [Intel XE#7916]) -> ([SKIP][197], [SKIP][198]) ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][199] ([Intel XE#7916]) -> ([SKIP][200], [SKIP][201]) ([Intel XE#7915] / [Intel XE#7916]) +1 other test ( 2 skip )
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][202] ([Intel XE#7915]) -> ([PASS][203], [SKIP][204]) ([Intel XE#7915]) +1 other test ( 1 pass, 1 skip )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][205] ([Intel XE#2938] / [Intel XE#7376]) -> ([SKIP][206], [SKIP][207]) ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@kms_pm_backlight@brightness-with-dpms.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][208] ([Intel XE#7376] / [Intel XE#870]) -> [SKIP][209] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@kms_pm_backlight@fade.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][210] ([Intel XE#7376] / [Intel XE#870]) -> ([SKIP][211], [SKIP][212]) ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) +3 other tests ( 2 skip )
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][213] ([Intel XE#2426] / [Intel XE#5848]) -> ([FAIL][214], [SKIP][215]) ([Intel XE#1729] / [Intel XE#2426] / [Intel XE#5848] / [Intel XE#7424])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][216] ([Intel XE#2426] / [Intel XE#5848]) -> ([SKIP][217], [SKIP][218]) ([Intel XE#2426] / [Intel XE#2509] / [Intel XE#5848] / [Intel XE#7437])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7331
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7388
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7933]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7933
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870


Build changes
-------------

  * IGT: IGT_8912 -> IGTPW_15187
  * Linux: xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976 -> xe-5066-2edbd77a2045d12d30c95dbb5842b831e3da0035

  IGTPW_15187: 2b679f12e7f7e7ad4ce135558bce3aa2019705c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8912: 22222b7d987067331459c2a866e6387a669b7f70 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976: dee34cfbffbfe2196a9332f966b006cd2e54e976
  xe-5066-2edbd77a2045d12d30c95dbb5842b831e3da0035: 2edbd77a2045d12d30c95dbb5842b831e3da0035

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/index.html

--===============0787886766395318528==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] tests/amdgpu: Fix queue reset monitor logic and allow -ETIME in CS helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166608/">https://patchwork.freedesktop.org/series/166608/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8912_FULL -&gt; XEIGTPW_15187_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15187_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15187_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15187_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-3/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_rotation_crc@multiplane-rotation.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-1/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-5/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html">DMESG-WARN</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15187_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_chamelium_color@ctm-max.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_content_protection@legacy.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_content_protection@legacy.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_feature_discovery@display-3x.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_feature_discovery@display-3x.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_flip@2x-plain-flip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_flip@2x-plain-flip.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814">Intel XE#7814</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7933">Intel XE#7933</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +25 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@xe_eudebug_online@single-step-one.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@xe_eudebug_online@single-step-one.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@xe_exec_balancer@twice-parallel-basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@xe_exec_balancer@twice-parallel-basic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-1/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-5/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-imm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@xe_exec_fault_mode@once-multi-queue-imm.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-gt-reset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-gt-reset.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-8/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-7/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@xe_page_reclaim@invalid-1g.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-10/igt@xe_page_reclaim@invalid-1g.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-3/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-5/igt@xe_sriov_vram@vf-access-after-resize-up.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@xe_sriov_vram@vf-access-after-resize-up.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@xe_survivability@i2c-functionality.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-4/igt@xe_survivability@i2c-functionality.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529">Intel XE#6529</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7331">Intel XE#7331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7388">Intel XE#7388</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914">Intel XE#7914</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-2/igt@kms_cursor_crc@cursor-size-hints.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814">Intel XE#7814</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_cursor_crc@cursor-size-hints.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_cursor_crc@cursor-size-hints.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-2/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-8/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3.html">FAIL</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-3.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind@rcs0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-5/igt@xe_exec_basic@twice-userptr-rebind@rcs0.html">ABORT</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-3/igt@xe_exec_basic@twice-userptr-rebind@rcs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-8/igt@xe_exec_basic@twice-userptr-rebind@rcs0.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html">FAIL</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-7/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-7/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8912/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15187/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8912 -&gt; IGTPW_15187</li>
<li>Linux: xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976 -&gt; xe-5066-2edbd77a2045d12d30c95dbb5842b831e3da0035</li>
</ul>
<p>IGTPW_15187: 2b679f12e7f7e7ad4ce135558bce3aa2019705c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8912: 22222b7d987067331459c2a866e6387a669b7f70 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5062-dee34cfbffbfe2196a9332f966b006cd2e54e976: dee34cfbffbfe2196a9332f966b006cd2e54e976<br />
  xe-5066-2edbd77a2045d12d30c95dbb5842b831e3da0035: 2edbd77a2045d12d30c95dbb5842b831e3da0035</p>

</body>
</html>

--===============0787886766395318528==--
