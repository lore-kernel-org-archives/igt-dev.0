Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6525C282C6
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 21:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BED10E2F8;
	Mon,  3 Mar 2025 21:33:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A3E10E23F;
 Mon,  3 Mar 2025 21:33:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7400518624714868890=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/amdgpu/amd=5Freplay?=
 =?utf-8?q?=3A_Skip_test_if_no_DRM_DP_AUX_Interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tom Chung" <chiahsuan.chung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 03 Mar 2025 21:33:19 -0000
Message-ID: <174103759966.269100.14168282713376108819@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250303095635.2874-1-chiahsuan.chung@amd.com>
In-Reply-To: <20250303095635.2874-1-chiahsuan.chung@amd.com>
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

--===============7400518624714868890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_replay: Skip test if no DRM DP AUX Interface
URL   : https://patchwork.freedesktop.org/series/145709/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8257_full -> XEIGTPW_12690_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12690_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12690_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12690_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a2-dp2.html

  * igt@kms_rmfb@close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][2] +36 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_rmfb@close-fd.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          [PASS][3] -> [SKIP][4] +43 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_vblank@query-forked.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_vblank@query-forked.html

  
#### Warnings ####

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          [SKIP][5] ([Intel XE#664]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_async_flips@test-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          [SKIP][7] ([Intel XE#3279]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][9] ([Intel XE#1407]) -> [SKIP][10] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][11] ([Intel XE#1124]) -> [SKIP][12] +13 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          [SKIP][13] ([Intel XE#2191]) -> [SKIP][14] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          [SKIP][15] ([Intel XE#367]) -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][17] ([Intel XE#2669]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][19] ([Intel XE#2887]) -> [SKIP][20] +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][21] ([Intel XE#2669] / [Intel XE#3433]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-lnl:          [SKIP][23] ([Intel XE#3432]) -> [SKIP][24] +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          [SKIP][25] ([Intel XE#307]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          [SKIP][27] ([Intel XE#3278]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_content_protection@lic-type-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          [SKIP][29] ([Intel XE#1424]) -> [SKIP][30] +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-lnl:          [SKIP][31] ([Intel XE#2321]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][33] ([Intel XE#309]) -> [SKIP][34] +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          [SKIP][35] ([Intel XE#323]) -> [SKIP][36] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          [SKIP][37] ([Intel XE#4354]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_dp_link_training@uhbr-sst.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-lnl:          [SKIP][39] ([Intel XE#599]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_plane_lowres@tiling-none.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][41] ([Intel XE#1127]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-lnl:          [SKIP][43] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-270.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          [SKIP][45] ([Intel XE#1499]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_vrr@negative-basic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_vrr@negative-basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@valid-flag}:
    - shard-bmg:          NOTRUN -> [FAIL][47]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@xe_create@valid-flag.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][48]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_create@valid-flag.html
    - shard-lnl:          NOTRUN -> [FAIL][49]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@xe_create@valid-flag.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12690_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-read:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2134])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@fbdev@unaligned-read.html

  * igt@fbdev@unaligned-write:
    - shard-lnl:          [PASS][51] -> [SKIP][52] ([Intel XE#2134])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@fbdev@unaligned-write.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@fbdev@unaligned-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          NOTRUN -> [FAIL][53] ([Intel XE#911]) +3 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#2550] / [Intel XE#3767]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][55] -> [DMESG-WARN][56] ([Intel XE#4330]) +14 other tests dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-8/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#3768])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#3768])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#3279])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2370]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#3658])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#316]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1407]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2327]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1124]) +8 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1124]) +16 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2328])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#619])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1124]) +8 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [PASS][70] -> [SKIP][71] ([Intel XE#2191])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2191])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2314] / [Intel XE#2894])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#2191])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#367]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#367]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#787]) +219 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#2887]) +13 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#455] / [Intel XE#787]) +61 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#2669]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2887]) +25 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#3442])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][85] -> [DMESG-WARN][86] ([Intel XE#4199])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#3432]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#3432]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2907]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][90] -> [INCOMPLETE][91] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2724])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#4418])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#4418])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#4416]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#373]) +11 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_chamelium_audio@dp-audio.html
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#373]) +8 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2325]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#306])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2252]) +15 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [PASS][102] -> [SKIP][103] ([Intel XE#1511])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_color@deep-color.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][104] ([Intel XE#4132])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2390])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#307])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2341])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [FAIL][108] ([Intel XE#1178]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][109] ([Intel XE#1188]) +1 other test fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@kms_content_protection@uevent.html
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#3278]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_content_protection@uevent.html
    - shard-bmg:          NOTRUN -> [FAIL][111] ([Intel XE#1188]) +1 other test fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#308]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1424])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2321]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-64x64:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][115] ([Intel XE#4330]) +8 other tests dmesg-warn
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_cursor_crc@cursor-random-64x64.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2320]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2286]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#323]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2291])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [PASS][120] -> [SKIP][121] ([Intel XE#309])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
    - shard-bmg:          [PASS][122] -> [DMESG-WARN][123] ([Intel XE#877])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#309]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
    - shard-bmg:          NOTRUN -> [DMESG-WARN][125] ([Intel XE#877])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#1508])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [PASS][127] -> [SKIP][128] ([Intel XE#455]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2244]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#2244])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#4422])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-lnl:          [PASS][132] -> [SKIP][133] ([Intel XE#776])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_fbcon_fbt@psr.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#703])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1138])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#1138])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1138])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-lnl:          [PASS][138] -> [SKIP][139] ([Intel XE#1135])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_feature_discovery@psr1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2-set2:     [PASS][140] -> [FAIL][141] ([Intel XE#886])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_flip@2x-blocking-wf_vblank.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][142] -> [FAIL][143] ([Intel XE#3321]) +1 other test fail
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [PASS][144] -> [SKIP][145] ([Intel XE#310]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@kms_flip@2x-flip-vs-modeset.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#1421]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][147] -> [DMESG-WARN][148] ([Intel XE#2955])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][149] -> [DMESG-WARN][150] ([Intel XE#4330]) +13 other tests dmesg-warn
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#310]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][152] ([Intel XE#2955]) +1 other test dmesg-warn
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][153] ([Intel XE#2955])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-lnl:          [PASS][154] -> [SKIP][155] ([Intel XE#2482]) +6 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_flip@blocking-absolute-wf_vblank.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#2482]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][157] ([Intel XE#301] / [Intel XE#3321]) +3 other tests fail
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][158] ([Intel XE#301]) +3 other tests fail
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][159] ([Intel XE#301]) +1 other test fail
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][160] ([Intel XE#4330])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][161] -> [FAIL][162] ([Intel XE#301]) +3 other tests fail
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#1397] / [Intel XE#1745])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1397]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#1401]) +6 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#1745]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2293]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-linear:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][170] ([Intel XE#4330]) +12 other tests dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-linear.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2312]) +9 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2311]) +42 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#4141]) +18 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#656]) +9 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][175] -> [SKIP][176] ([Intel XE#656]) +5 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#651]) +34 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#651]) +8 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#658])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#1469])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2352])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#653]) +33 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#2313]) +33 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#2548]) +24 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [PASS][185] -> [SKIP][186] ([Intel XE#2548]) +18 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#656]) +30 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#605])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-lnl:          [PASS][189] -> [SKIP][190] ([Intel XE#2568])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_invalid_mode@uint-max-clock.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_invalid_mode@zero-vdisplay:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#2568])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_invalid_mode@zero-vdisplay.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#2934]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#346])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#346])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#4328])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][196] ([Intel XE#2925])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][197] ([Intel XE#2486])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#4329])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#4359])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-lnl:          [PASS][200] -> [SKIP][201] ([Intel XE#3380])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_plane@plane-panning-top-left.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][202] ([Intel XE#616]) +3 other tests fail
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][203] -> [FAIL][204] ([Intel XE#616]) +1 other test fail
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_plane_cursor@viewport.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#599]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#2493])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#2763]) +15 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:
    - shard-lnl:          [PASS][208] -> [SKIP][209] ([Intel XE#2763]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][210] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#2763]) +8 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#2763]) +34 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][213] ([Intel XE#870]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#870]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2938])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#2938])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#870]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#1131])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][219] ([Intel XE#2505])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][220] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-lnl:          [PASS][221] -> [SKIP][222] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#836])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-lnl:          NOTRUN -> [SKIP][224] ([Intel XE#1439] / [Intel XE#3141]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][225] -> [DMESG-WARN][226] ([Intel XE#2042] / [Intel XE#4330])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#2893]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][228] ([Intel XE#1489]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][229] ([Intel XE#1489]) +14 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          [PASS][230] -> [SKIP][231] ([Intel XE#1489]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][232] ([Intel XE#1489]) +10 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][233] ([Intel XE#2850] / [Intel XE#929]) +14 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][234] ([Intel XE#3924])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][235] ([Intel XE#1406]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][236] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][237] ([Intel XE#2234] / [Intel XE#2850]) +17 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [PASS][238] -> [SKIP][239] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-onoff.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][240] ([Intel XE#1127])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][241] ([Intel XE#3414]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#2413]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][244] ([Intel XE#374]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][245] ([Intel XE#1435])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][246] ([Intel XE#2450])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][247] ([Intel XE#455]) +19 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][248] ([Intel XE#1499]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][249] ([Intel XE#756])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-lnl:          NOTRUN -> [SKIP][250] ([Intel XE#756])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][251] ([Intel XE#1091] / [Intel XE#2849])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][252] ([Intel XE#1091] / [Intel XE#2849])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][253] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][254] ([Intel XE#1123])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][255] ([Intel XE#1126]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][256] ([Intel XE#3889])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][257] ([Intel XE#3889])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-lnl:          NOTRUN -> [SKIP][258] ([Intel XE#3889])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][259] ([Intel XE#2905]) +14 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
    - shard-lnl:          NOTRUN -> [SKIP][260] ([Intel XE#2905]) +9 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> [SKIP][261] ([Intel XE#2905]) +10 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][262] ([Intel XE#688]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][263] ([Intel XE#2322]) +11 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][264] -> [SKIP][265] ([Intel XE#1392]) +3 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][266] ([Intel XE#1392]) +5 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][267] ([Intel XE#1392])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][268] ([Intel XE#288]) +21 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][269] ([Intel XE#2360]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][270] ([Intel XE#2229])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [PASS][271] -> [FAIL][272] ([Intel XE#1999]) +2 other tests fail
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][273] ([Intel XE#586])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@xe_mmap@small-bar.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][274] ([Intel XE#512])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_mmap@small-bar.html
    - shard-lnl:          NOTRUN -> [SKIP][275] ([Intel XE#512])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][276] ([Intel XE#1416])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@xe_mmap@vram.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][277] ([Intel XE#2457])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@xe_module_load@force-load.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][278] ([Intel XE#378])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_module_load@force-load.html
    - shard-lnl:          NOTRUN -> [SKIP][279] ([Intel XE#378])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304]) -> ([SKIP][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330]) ([Intel XE#378])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-436/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-436/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-436/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-436/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_module_load@load.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][331] ([Intel XE#2541] / [Intel XE#3573]) +7 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][332] ([Intel XE#1337])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][333] ([Intel XE#1173])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][334] ([Intel XE#2284]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][335] ([Intel XE#2284] / [Intel XE#366])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][336] ([Intel XE#584]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][337] ([Intel XE#4330] / [Intel XE#569])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][338] -> [DMESG-WARN][339] ([Intel XE#4330] / [Intel XE#569]) +1 other test dmesg-warn
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [PASS][340] -> [DMESG-WARN][341] ([Intel XE#4330] / [Intel XE#569]) +1 other test dmesg-warn
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     NOTRUN -> [ABORT][342] ([Intel XE#4268])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_pm@s4-basic.html
    - shard-lnl:          NOTRUN -> [ABORT][343] ([Intel XE#4268])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-bmg:          NOTRUN -> [ABORT][344] ([Intel XE#4268]) +1 other test abort
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][345] ([Intel XE#944])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][346] ([Intel XE#944])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-lnl:          NOTRUN -> [SKIP][347] ([Intel XE#944])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][348] ([Intel XE#4130]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][349] ([Intel XE#4130])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [SKIP][350] ([Intel XE#4273])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][351] ([Intel XE#4351])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
    - shard-bmg:          NOTRUN -> [SKIP][352] ([Intel XE#4351])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - shard-lnl:          [SKIP][353] ([Intel XE#2134]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@fbdev@info.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@fbdev@info.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][355] -> [PASS][356] +2 other tests pass
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          [DMESG-WARN][357] ([Intel XE#4330]) -> [PASS][358] +17 other tests pass
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-lnl:          [DMESG-WARN][359] ([Intel XE#2932]) -> [PASS][360] +2 other tests pass
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - shard-dg2-set2:     [INCOMPLETE][361] ([Intel XE#3226]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][363] ([Intel XE#2291]) -> [PASS][364] +4 other tests pass
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#309]) -> [PASS][366] +1 other test pass
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-lnl:          [SKIP][367] ([Intel XE#3009]) -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_dp_aux_dev.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_dp_aux_dev.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [DMESG-FAIL][369] ([Intel XE#4330]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_fbcon_fbt@fbc-suspend.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#310]) -> [PASS][372] +4 other tests pass
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][373] ([Intel XE#2316]) -> [PASS][374] +1 other test pass
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][375] ([Intel XE#3321]) -> [PASS][376] +1 other test pass
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][377] ([Intel XE#301]) -> [PASS][378] +3 other tests pass
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][379] ([Intel XE#886]) -> [PASS][380] +2 other tests pass
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [DMESG-WARN][381] ([Intel XE#2955]) -> [PASS][382] +1 other test pass
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][383] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [SKIP][385] ([Intel XE#2482]) -> [PASS][386] +5 other tests pass
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [SKIP][387] ([Intel XE#1745]) -> [PASS][388] +2 other tests pass
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-lnl:          [SKIP][389] ([Intel XE#2682]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#656]) -> [PASS][392] +1 other test pass
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-lnl:          [SKIP][393] ([Intel XE#2548]) -> [PASS][394] +19 other tests pass
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-lnl:          [SKIP][395] ([Intel XE#4328]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_joiner@basic-force-big-joiner.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-lnl:          [SKIP][397] ([Intel XE#3380]) -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-dg2-set2:     [DMESG-WARN][399] ([Intel XE#4361]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@kms_plane_multiple@tiling-4.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-lnl:          [SKIP][401] ([Intel XE#3308]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_plane_scaling@invalid-parameters.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [DMESG-WARN][403] ([Intel XE#2566] / [Intel XE#4330]) -> [PASS][404] +1 other test pass
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-bmg:          [INCOMPLETE][405] ([Intel XE#2566]) -> [PASS][406] +1 other test pass
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-lnl:          [SKIP][407] ([Intel XE#2763]) -> [PASS][408] +13 other tests pass
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-lnl:          [SKIP][409] ([Intel XE#870]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_pm_backlight@fade-with-dpms.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#836]) -> [PASS][412] +1 other test pass
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][413] ([Intel XE#1489]) -> [PASS][414] +3 other tests pass
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@psr-no-drrs:
    - shard-lnl:          [SKIP][415] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][416] +6 other tests pass
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_psr@psr-no-drrs.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_psr@psr-no-drrs.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [SKIP][417] ([Intel XE#1435]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_setmode@basic.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][419] ([Intel XE#1435]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-lnl:          [SKIP][421] -> [PASS][422] +42 other tests pass
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     [DMESG-WARN][423] ([Intel XE#4330]) -> [PASS][424] +63 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1392]) -> [PASS][426] +1 other test pass
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     [DMESG-WARN][427] -> [PASS][428]
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
    - shard-bmg:          [DMESG-WARN][429] -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [DMESG-WARN][431] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][432] +2 other tests pass
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-dg2-set2:     [DMESG-WARN][433] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][434] +2 other tests pass
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-lnl:          [SKIP][435] -> [SKIP][436] ([Intel XE#873])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][437] -> [SKIP][438] ([Intel XE#3658])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-lnl:          [SKIP][439] -> [SKIP][440] ([Intel XE#1407]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][441] -> [SKIP][442] ([Intel XE#1124]) +10 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][443] -> [SKIP][444] ([Intel XE#1477])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][445] -> [SKIP][446] ([Intel XE#1428])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          [SKIP][447] -> [SKIP][448] ([Intel XE#2191])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          [SKIP][449] -> [SKIP][450] ([Intel XE#367]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          [SKIP][451] -> [SKIP][452] ([Intel XE#1512])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][454] ([Intel XE#787]) +8 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#787]) -> [SKIP][456] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          [SKIP][457] -> [SKIP][458] ([Intel XE#2887]) +6 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][459] ([Intel XE#1178]) -> [DMESG-FAIL][460] ([Intel XE#4330]) +1 other test dmesg-fail
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@kms_content_protection@atomic.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_content_protection@atomic.html
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#455]) -> [INCOMPLETE][462] ([Intel XE#4132])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_content_protection@atomic.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          [SKIP][463] -> [SKIP][464] ([Intel XE#3278]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_content_protection@content-type-change.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [DMESG-FAIL][465] ([Intel XE#4330]) -> [SKIP][466] ([Intel XE#455])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_content_protection@lic-type-0.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][467] ([Intel XE#4330]) -> [FAIL][468] ([Intel XE#1178]) +1 other test fail
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][469] -> [SKIP][470] ([Intel XE#1468])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_content_protection@mei-interface.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          [SKIP][471] -> [SKIP][472] ([Intel XE#2321])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x170.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          [SKIP][473] -> [SKIP][474] ([Intel XE#1424]) +3 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          [SKIP][475] -> [SKIP][476] ([Intel XE#309]) +2 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#309]) -> [DMESG-WARN][478] ([Intel XE#4330])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [SKIP][479] -> [SKIP][480] ([Intel XE#323])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][481] ([i915#3804]) -> [SKIP][482] ([Intel XE#455] / [i915#3804])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [INCOMPLETE][483] ([Intel XE#2594]) -> [SKIP][484] ([Intel XE#455])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@kms_dsc@dsc-with-formats.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          [SKIP][485] -> [SKIP][486] ([Intel XE#2244]) +1 other test skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-bmg:          [DMESG-WARN][487] ([Intel XE#4330]) -> [SKIP][488] ([Intel XE#2316])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [DMESG-WARN][489] ([Intel XE#4330]) -> [SKIP][490] ([Intel XE#310])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][491] ([Intel XE#301] / [Intel XE#3149]) -> [SKIP][492] ([Intel XE#2482])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][493] ([Intel XE#2049]) -> [DMESG-FAIL][494] ([Intel XE#4330])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          [SKIP][495] ([Intel XE#1745]) -> [SKIP][496] ([Intel XE#1397] / [Intel XE#1745])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          [SKIP][497] ([Intel XE#1745]) -> [SKIP][498] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-lnl:          [SKIP][499] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][500] ([Intel XE#1745]) +5 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#656]) -> [SKIP][502] ([Intel XE#651]) +11 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][503] ([Intel XE#2312]) -> [SKIP][504] ([Intel XE#2311]) +8 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          [SKIP][505] ([Intel XE#2548]) -> [SKIP][506] ([Intel XE#651]) +10 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][507] ([Intel XE#4141]) -> [SKIP][508] ([Intel XE#2312]) +2 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][509] ([Intel XE#2312]) -> [SKIP][510] ([Intel XE#4141]) +2 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][511] ([Intel XE#2548]) -> [SKIP][512] ([Intel XE#656]) +28 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][513] ([Intel XE#2311]) -> [SKIP][514] ([Intel XE#2312]) +8 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#651]) -> [SKIP][516] ([Intel XE#656]) +12 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][517] ([Intel XE#651]) -> [SKIP][518] ([Intel XE#2548]) +14 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][519] ([Intel XE#2312]) -> [SKIP][520] ([Intel XE#2313]) +2 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#656]) -> [SKIP][522] ([Intel XE#653]) +8 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#653]) -> [SKIP][524] ([Intel XE#656]) +8 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][525] ([Intel XE#2313]) -> [SKIP][526] ([Intel XE#2312]) +7 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][527] ([Intel XE#656]) -> [SKIP][528] ([Intel XE#2548]) +30 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][529] ([Intel XE#3544]) -> [SKIP][530] ([Intel XE#3374] / [Intel XE#3544])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          [SKIP][531] -> [SKIP][532] ([Intel XE#1503])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][533] ([Intel XE#324]) -> [SKIP][534] ([Intel XE#3380])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_plane@plane-position-hole.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-lnl:          [SKIP][535] -> [SKIP][536] ([Intel XE#599])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_plane_lowres@tiling-x.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][537] ([Intel XE#1430]) -> [SKIP][538] ([Intel XE#1129])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [SKIP][539] ([Intel XE#2861]) -> [FAIL][540] ([Intel XE#2029])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][541] ([Intel XE#1489]) -> [SKIP][542] ([Intel XE#2893]) +2 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          [SKIP][543] ([Intel XE#2893]) -> [SKIP][544] ([Intel XE#1489]) +4 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          [SKIP][545] ([Intel XE#1122]) -> [SKIP][546] ([Intel XE#1128])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_psr2_su@page_flip-xrgb8888.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-lnl:          [SKIP][547] ([Intel XE#1406]) -> [SKIP][548] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-2/igt@kms_psr@fbc-pr-sprite-plane-move.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-lnl:          [SKIP][549] ([Intel XE#2850] / [Intel XE#929]) -> [FAIL][550] ([Intel XE#3924])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          [SKIP][551] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][552] ([Intel XE#1406]) +1 other test skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_psr@pr-sprite-blt.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][553] -> [SKIP][554] ([Intel XE#1127]) +1 other test skip
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-lnl:          [SKIP][555] -> [SKIP][556] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-lnl:          [SKIP][557] -> [SKIP][558] ([Intel XE#2413] / [Intel XE#374])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_scaling_modes@scaling-mode-none.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          [SKIP][559] -> [SKIP][560] ([Intel XE#1499])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#1061]) -> [FAIL][562] ([Intel XE#1173])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@xe_peer2peer@read.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_peer2peer@read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2682]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2861
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3308
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4199]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4199
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4361
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8257 -> IGTPW_12690

  IGTPW_12690: 12690
  IGT_8257: 8257
  xe-2747-413ae464b8021542ad90cb1fbb15f8efc5050a5d: 413ae464b8021542ad90cb1fbb15f8efc5050a5d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/index.html

--===============7400518624714868890==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_replay: Skip test if no DRM=
 DP AUX Interface</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/145709/">https://patchwork.freedesktop.org/series/145709/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12690/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12690/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8257_full -&gt; XEIGTPW_12690_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12690_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12690_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
690_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_flip@2x-blocking-wf_vblank=
@ab-hdmi-a2-dp2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_rmfb@close-fd.html">SKIP</a>=
 +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_vblank@query-forked.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/i=
gt@kms_vblank@query-forked.html">SKIP</a> +43 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_async_flips@test-cursor-atomic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Inte=
l XE#664</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12690/shard-lnl-7/igt@kms_async_flips@test-cursor-atomic.html">SKIP</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transiti=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3279">Intel XE#3279</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_atomic_transition@plane-all=
-modeset-transition.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-=
stride-64bpp-rotate-180-hflip.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-1=
80-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-h=
w-stride-64bpp-rotate-180-hflip.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2=
160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12690/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2160x1440=
p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669=
">Intel XE#2669</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12690/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.ht=
ml">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-mtl-rc-ccs.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2669">Intel XE#2669</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3433">Intel XE#3433</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_ccs@crc-primary-susp=
end-4-tiled-bmg-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled=
-dg2-mc-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">In=
tel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12690/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_content_protection@lic-type-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Inte=
l XE#3278</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12690/shard-lnl-1/igt@kms_content_protection@lic-type-1.html">SKIP</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1424">Intel XE#1424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-1=
28x42.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2321">Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-=
512x512.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_cursor_legacy=
@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE=
#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12690/shard-lnl-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_plane_lowres@tiling-none.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#5=
99</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
690/shard-lnl-7/igt@kms_plane_lowres@tiling-none.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1127">Intel XE#1127</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-refl=
ect-x-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">I=
ntel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3904">Intel XE#3904</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_rotation_crc@sprite-rotatio=
n-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1269=
0/shard-lnl-7/igt@kms_vrr@negative-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_create@valid-flag}:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@xe_create@valid-flag.html">FAIL<=
/a></li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_create@valid-flag.html">FAI=
L</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@xe_create@valid-flag.html">FAIL<=
/a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12690_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@fbdev@unaligned-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">I=
ntel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt=
@fbdev@unaligned-write.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_async_flips@async-flip-with-=
page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel X=
E#3767</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-8/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/s=
hard-bmg-1/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE=
#4330</a>) +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_async_flips@invalid-async-=
flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_big_fb@linear-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
28">Intel XE#2328</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920=
x1080p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12690/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12690/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_bw@connected-linear-tiling=
-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_bw@linear-tiling-3-display=
s-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-til=
ed-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/787">Intel XE#787</a>) +219 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +61 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tile=
d-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12690/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-cc=
s.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4199">Intel XE#4199</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12690/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel=
 XE#3124</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@kms_cdclk@mode-transition-all-=
outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4418">Intel XE#4418</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_chamelium_audio@dp-audio.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +11 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_chamelium_audio@dp-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to=
-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_chamelium_color@ctm-limite=
d-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-chang=
e-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_color@deep-color.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@=
kms_color@deep-color.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1511">Intel XE#1511</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_content_protection@atomic@=
pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4132">Intel XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@kms_content_protection@dp-mst-=
type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_content_protection@srm.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@kms_content_protection@uevent.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1188">Intel XE#1188</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_content_protection@uevent.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_cursor_crc@cursor-random-64x=
64.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4330">Intel XE#4330</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-64=
x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test ski=
p</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-f=
lip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-fli=
pb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12690/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"=
>Intel XE#309</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2690/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
7">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/sh=
ard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
4">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_fbcon_fbt@psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@k=
ms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_feature_discovery@display-=
4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_feature_discovery@psr1.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-=
1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shar=
d-dg2-432/igt@kms_flip@2x-blocking-wf_vblank.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12690/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-432/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-d=
g2-464/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12690/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-h=
dmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interru=
ptible@cd-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +13 other tests dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-=
race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) +1 other test dmesg-war=
n</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_flip@2x-modeset-vs-vblank-=
race-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_flip@blocking-absolute-wf_vblank.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/=
shard-lnl-7/igt@kms_flip@blocking-absolute-wf_vblank.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#248=
2</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_flip@flip-vs-dpms-off-vs-mod=
eset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2482">Intel XE#2482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-=
interruptible@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@c-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@d-dp2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12690/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#13=
97</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#14=
01</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-linear-to-linear:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_flip_tiling@flip-change-ti=
ling@pipe-d-hdmi-a-6-linear-to-linear.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +1=
2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +42 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +18 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdr=
rs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +34 other tests skip</=
li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdr=
rs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1469">Intel XE#1469</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +33 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +33 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) +24 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-m=
sflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primsc=
rn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2548">Intel XE#2548</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +30 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_invalid_mode@uint-max-clock.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard=
-lnl-1/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_invalid_mode@zero-vdisplay.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2934">Intel XE#2934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_joiner@invalid-modeset-big=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_joiner@invalid-modeset-for=
ce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/248=
6">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4329">Intel XE#4329</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb888=
8-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_plane@plane-panning-top-left.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shar=
d-lnl-1/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2=
-434/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_plane_lowres@tiling-x@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/599">Intel XE#599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with=
-modifiers@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_plane_scaling@plane-upscal=
e-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +34 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/870">Intel XE#870</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_pm_backlight@basic-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_pm_backlight@brightness-wi=
th-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_pm_backlight@fade-with-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">In=
tel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">I=
ntel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-=
lnl-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3=
141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/83=
6">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/836">Intel XE#836</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3141">Intel XE#3141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/s=
hard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE=
#2042</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_psr2_sf@pr-cursor-plane-upda=
te-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +14 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-s=
f.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12690/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
50">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-on=
off@edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3924">Intel XE#3924</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_psr@pr-cursor-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_psr@pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-onoff.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard=
-lnl-1/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#=
929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-n=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@kms_scaling_modes@scaling-mode-n=
one@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/374">Intel XE#374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@kms_vrr@flip-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_writeback@writeback-check-=
output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_writeback@writeback-check-ou=
tput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-un=
bind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_compute_preempt@compute-thr=
eadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-=
0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0=
x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_eudebug@basic-vm-access-par=
ameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-=
reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufence-=
sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_eudebug_online@interrupt-al=
l-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +14 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@xe_eudebug_online@interrupt-all-=
set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@xe_eudebug_online@stopped-thread=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-4/igt@xe_evict@evict-beng-large-cm.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_exec_basi=
c@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/139=
2">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_exec_basic@multigpu-once-nu=
ll-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_exec_fault_mode@once-bindex=
ecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner=
-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@xe_live_ktest@xe_migrate@xe_va=
lidate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12690/shard-dg2-436/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_ku=
nit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel=
 XE#586</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_mmap@small-bar.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Int=
el XE#512</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel=
 XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@xe_mmap@vram.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#=
1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
57">Intel XE#2457</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_module_load@force-load.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
378">Intel XE#378</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
8">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8257/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-432/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8257/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8257/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-=
dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257=
/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8257/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8257/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8257/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-46=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8257/shard-dg2-436/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_825=
7/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-434/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8257/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8257/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8257/shard-dg2-463/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8257/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/s=
hard-dg2-436/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12690/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shar=
d-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12690/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12690/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2=
-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
690/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12690/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12690/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shar=
d-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12690/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream=
-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-463/igt@xe_pat@display-vs-wb-transient=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_peer2peer@read@read-gpua-vr=
am01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@xe_pm@s3-d3hot-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@xe_pm@s3-multiple-execs.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-d=
g2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel X=
E#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/=
igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@xe_pm@s4-basic.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Inte=
l XE#4268</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@xe_pm@s4-basic.html">ABORT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel =
XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@xe_pm@s4-d3hot-basic-exec.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
268">Intel XE#4268</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@xe_query@multigpu-query-cs-cyc=
les.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_sriov_auto_provisioning@sel=
fconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@xe_sriov_auto_provisioning@selfc=
onfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273"=
>Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_sriov_scheduling@nonpreempt=
-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@xe_sriov_scheduling@nonpreempt-e=
ngine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@fbdev@info.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-5/=
igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12690/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-c=
cs-cc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x256.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x256.=
html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">In=
tel XE#2932</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12690/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3226">Intel XE#3226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-f=
lipa-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@kms_cursor_lega=
cy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +4 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@kms_cursor_le=
gacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +1 oth=
er test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-ln=
l-8/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Inte=
l XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12690/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/310">Intel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_flip@2x-absolute-wf_vblank-inte=
rruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12690/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ac-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ad-hdmi-a6-dp4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#88=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_126=
90/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2955">Intel XE#2955</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12690/shard-dg2-433/igt@kms_flip@flip-vs-dpms-off-vs-modese=
t.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-433/igt@kms_flip@flip-vs-su=
spend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/248=
2">Intel XE#2482</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12690/shard-lnl-5/igt@kms_flip@flip-vs-wf_vblank-interruptible.=
html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xt=
ile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_flip_scaled_crc@=
flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> +2 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682">Int=
el XE#2682</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12690/shard-lnl-4/igt@kms_flip_tiling@flip-change-tiling.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multid=
raw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2548">Intel XE#2548</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1=
p-pri-indfb-multidraw.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">Inte=
l XE#4328</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12690/shard-lnl-3/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380">I=
ntel XE#3380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12690/shard-lnl-5/igt@kms_plane@plane-panning-bottom-right.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-433/igt@kms_plane_multiple@tiling-4.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4361">In=
tel XE#4361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12690/shard-dg2-434/igt@kms_plane_multiple@tiling-4.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_plane_scaling@invalid-parameters.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3308">I=
ntel XE#3308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12690/shard-lnl-4/igt@kms_plane_scaling@invalid-parameters.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-with-clipping-c=
lamping-pixel-formats.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg=
2-432/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-forma=
ts.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modif=
iers.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_plane_scaling@plane=
-upscale-20x20-with-modifiers.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_plane_scaling@planes-scaler-unity-scaling@pi=
pe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_plane_scaling@planes-scal=
er-unity-scaling@pipe-b.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel X=
E#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12690/shard-lnl-4/igt@kms_pm_backlight@fade-with-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1269=
0/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_psr2_sf@psr2-cursor-plane-mov=
e-continuous-sf.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel=
 XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12690/shard-lnl-4/igt@kms_psr@psr-no-drrs.html">PASS</a> +6 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_setmode@basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard=
-lnl-6/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel=
 XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12690/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-rpm.html">SKIP</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/s=
hard-lnl-3/igt@kms_vblank@ts-continuation-dpms-rpm.html">PASS</a> +42 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-432/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">=
Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12690/shard-dg2-464/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">PASS</=
a> +63 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe=
_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function=
-xe_device_create.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@xe_fault_injection@inj=
ect-fault-probe-function-xe_device_create.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-x=
e_device_create.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12690/shard-bmg-2/igt@xe_fault_injection@inject-=
fault-probe-function-xe_device_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-2/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel =
XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12690/shard-bmg-4/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</=
a> +2 other tests pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Inte=
l XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12690/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html">PA=
SS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/sh=
ard-lnl-4/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-=
hflip-async-flip.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12690/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/sh=
ard-lnl-8/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/sha=
rd-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)=
 +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.h=
tml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12690/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_126=
90/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel =
XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1=
440p.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12690/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html"=
>SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12690/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">I=
ntel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html"=
>SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12690/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">=
Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe=
-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_ccs@ba=
d-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_ccs@crc-primar=
y-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-c=
cs.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12690/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-m=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-1/igt@kms_content_protection@atomic.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12690/shard-bmg-2/igt@kms_content_protection@atomic.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel =
XE#4330</a>) +1 other test dmesg-fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12690/shard-dg2-436/igt@kms_content_protection@atomic.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Inte=
l XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_content_protection@content-type-change.html"=
>SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12690/shard-lnl-3/igt@kms_content_protection@content-type-change.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">=
Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_content_protection@lic-type-0.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/43=
30">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12690/shard-dg2-464/igt@kms_content_protection@lic-type-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.ht=
ml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12690/shard-bmg-1/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/=
shard-lnl-8/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#146=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/=
shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#232=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html=
">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12690/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424=
">Intel XE#1424</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"=
>SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12690/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">I=
ntel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12690/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor=
-vs-flip-atomic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
atomic-transitions.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a=
-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-433/igt@kms_dsc@dsc-with-formats.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel=
 XE#2594</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12690/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">S=
KIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
690/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Inte=
l XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
82">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2049">Intel XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_flip@flip-vs-expired-v=
blank-interruptible.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-l=
inear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_flip_scaled_=
crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"=
>Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-2/igt@kms_flip_scaled_cr=
c@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel=
 XE#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yt=
ilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt=
@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
745">Intel XE#1745</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-432/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_frontbuffer_tracking@=
drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimar=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2548">Intel XE#2548</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-in=
dfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-8/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shr=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +28 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) =
+12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12690/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2548">Intel XE#2548</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-7/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sh=
rfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-434/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12690/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-bmg-4/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-7/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) +30 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2690/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-=
6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Int=
el XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12690/shard-lnl-7/igt@kms_plane@plane-position-hole.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380">Intel XE=
#3380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_plane_lowres@tiling-x.html">SKIP</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard-lnl-3=
/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard=
-lnl-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2861">Intel XE#2861</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/sha=
rd-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-a=
rea.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12690/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">=
Intel XE#2893</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12690/shard-lnl-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel X=
E#1122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12690/shard-lnl-2/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1=
128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-2/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel=
 XE#1406</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12690/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel =
XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">In=
tel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12690/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-onof=
f.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3924">Intel XE#3924</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Int=
el XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12690/shard-lnl-5/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.ht=
ml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12690/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.=
html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12690/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/s=
hard-lnl-4/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">=
Intel XE#374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/shard=
-lnl-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8257/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12690/sha=
rd-dg2-436/igt@xe_peer2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8257 -&gt; IGTPW_12690</li>
</ul>
<p>IGTPW_12690: 12690<br />
  IGT_8257: 8257<br />
  xe-2747-413ae464b8021542ad90cb1fbb15f8efc5050a5d: 413ae464b8021542ad90cb1=
fbb15f8efc5050a5d</p>

</body>
</html>

--===============7400518624714868890==--
