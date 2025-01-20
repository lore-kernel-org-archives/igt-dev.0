Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EF6C02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 11:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEE710E3C7;
	Mon, 20 Jan 2025 11:11:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AD310E3C5;
 Mon, 20 Jan 2025 11:11:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6114185370831974730=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Ffbcon=5F?=
 =?utf-8?q?fbt=3A_Add_skip_condition_for_bmg_platform_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 20 Jan 2025 11:11:53 -0000
Message-ID: <173737151391.2101051.15076014259607409451@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241113110104.125403-1-mohammed.thasleem@intel.com>
In-Reply-To: <20241113110104.125403-1-mohammed.thasleem@intel.com>
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

--===============6114185370831974730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_fbcon_fbt: Add skip condition for bmg platform (rev5)
URL   : https://patchwork.freedesktop.org/series/141281/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8198_full -> XEIGTPW_12460_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12460_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12460_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12460_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic@atomic-plane-damage@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_atomic@atomic-plane-damage@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-bmg:          [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-lnl:          [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [PASS][9] -> [INCOMPLETE][10] +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a6.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a6.html

  
#### Warnings ####

  * igt@kms_atomic@atomic-plane-damage:
    - shard-bmg:          [SKIP][13] ([Intel XE#2423]) -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_atomic@atomic-plane-damage.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_atomic@atomic-plane-damage.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [FAIL][15] ([Intel XE#1695]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][17] ([Intel XE#2136]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][19] ([Intel XE#2423]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][21] ([Intel XE#1130]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_sriov_auto_provisioning@fair-allocation}:
    - shard-bmg:          [SKIP][23] ([Intel XE#1130]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocation.html

  
New tests
---------

  New tests have been introduced between XEIGT_8198_full and XEIGTPW_12460_full:

### New IGT tests (11) ###

  * igt@kms_atomic_interruptible@legacy-cursor@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [6.28] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.81] s

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a6-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_sequence@get-idle@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_sequence@get-idle@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_sequence@get-idle@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_sequence@get-idle@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [2.24] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12460_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#1885])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@core_hotunplug@hotrebind-lateclose.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2134]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-2/igt@fbdev@info.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@fbdev@info.html

  * igt@intel_hwmon@hwmon-write:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#2136])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1407]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-dg2-set2:     [PASS][31] -> [SKIP][32] ([Intel XE#2136]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#316])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1124]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1124]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#367])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1512])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#787]) +13 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#2887]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][41] -> [INCOMPLETE][42] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][43] -> [INCOMPLETE][44] ([Intel XE#1727] / [Intel XE#3124])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][45] ([Intel XE#3124])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#306]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-1/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#373]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#373]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#307])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][51] ([Intel XE#1178])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#1188])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1424])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-1/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#308])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2321]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#3007]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#309])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1340])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_draw_crc@draw-method-blt:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#2136]) +10 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-8/igt@kms_draw_crc@draw-method-blt.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_draw_crc@draw-method-blt.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#2423] / [i915#2575])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1421])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#2316])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_flip@2x-flip-vs-modeset.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][66] -> [INCOMPLETE][67] ([Intel XE#2597]) +2 other tests incomplete
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#2423]) +75 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][70] ([Intel XE#3321])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [PASS][71] -> [FAIL][72] ([Intel XE#3321])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp4:
    - shard-dg2-set2:     [PASS][73] -> [FAIL][74] ([Intel XE#301] / [Intel XE#3321])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][75] -> [FAIL][76] ([Intel XE#301]) +6 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [PASS][77] -> [FAIL][78] ([Intel XE#2882])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#886]) +5 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][81] -> [FAIL][82] ([Intel XE#886])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#455]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293] / [Intel XE#2380])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1397] / [Intel XE#1745])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1397])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2380])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#2136] / [Intel XE#2231]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1401]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2293]) +9 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#651]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#651]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#656]) +17 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#653]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1503]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#346])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#3012])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2493])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#2423] / [i915#2575]) +14 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#2763]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2763]) +19 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][108] -> [FAIL][109] ([Intel XE#718])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][110] ([Intel XE#1430])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@cursor:
    - shard-bmg:          [PASS][111] -> [SKIP][112] ([Intel XE#2446])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-2/igt@kms_pm_rpm@cursor.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2-set2:     [PASS][113] -> [SKIP][114] ([Intel XE#2446])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_pm_rpm@dpms-lpsp.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1489]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2893]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1128])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1406]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#362])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1499])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_vrr@negative-basic.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1280] / [Intel XE#455])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@basic-client:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#2905]) +6 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2905]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-dg2-set2:     [PASS][125] -> [SKIP][126] ([Intel XE#1130]) +28 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#688])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1392]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#288]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_live_ktest@xe_bo:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1192]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-6/igt@xe_live_ktest@xe_bo.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][132] ([Intel XE#1173]) +1 other test fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][134] -> [ABORT][135] ([Intel XE#1358])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][136] -> [ABORT][137] ([Intel XE#1358] / [Intel XE#1794]) +1 other test abort
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#584])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-7/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#944])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#944])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-2/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][141] -> [SKIP][142] ([Intel XE#1130]) +160 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [SKIP][143] ([Intel XE#1885]) -> [PASS][144] +2 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@core_hotunplug@hotrebind.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-8/igt@core_hotunplug@hotrebind.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [SKIP][145] ([Intel XE#3453]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@eof:
    - shard-bmg:          [SKIP][147] ([Intel XE#2134]) -> [PASS][148] +3 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@fbdev@eof.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@fbdev@eof.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][149] ([Intel XE#3908]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][151] ([Intel XE#2136]) -> [PASS][152] +29 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][155] ([Intel XE#2291]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [FAIL][157] ([Intel XE#1475]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][159] ([Intel XE#2882]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][161] ([Intel XE#301]) -> [PASS][162] +6 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][163] ([Intel XE#2316]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][165] ([Intel XE#886]) -> [PASS][166] +2 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp2:
    - shard-bmg:          [FAIL][167] ([Intel XE#3321]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
    - shard-dg2-set2:     [FAIL][169] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-bmg:          [SKIP][171] ([Intel XE#2136] / [Intel XE#2231]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#2136]) -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [SKIP][175] ([Intel XE#2446]) -> [PASS][176] +5 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [SKIP][177] ([Intel XE#2423]) -> [PASS][178] +134 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_properties@connector-properties-legacy.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [SKIP][179] ([Intel XE#3007]) -> [PASS][180] +6 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_sequence@get-idle.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_sequence@get-idle.html
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#2423] / [i915#2575]) -> [PASS][182] +6 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_sequence@get-idle.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_sequence@get-idle.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][183] ([Intel XE#1435]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][185] ([Intel XE#1499]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
    - shard-lnl:          [INCOMPLETE][187] ([Intel XE#2771]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-lnl-7/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-1/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][189] ([Intel XE#1130]) -> [PASS][190] +347 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][191] ([Intel XE#1192]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([SKIP][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218]) ([Intel XE#378]) -> ([PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][244] ([Intel XE#3546]) -> [PASS][245] +1 other test pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@xe_module_load@many-reload.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@xe_module_load@many-reload.html

  * igt@xe_vm@large-misaligned-binds-2097152:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1130]) -> [PASS][247] +9 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_vm@large-misaligned-binds-2097152.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@xe_vm@large-misaligned-binds-2097152.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [ABORT][248] ([Intel XE#3084]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][250] ([Intel XE#2423]) -> [SKIP][251] ([Intel XE#2233])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          [SKIP][252] ([Intel XE#2423]) -> [SKIP][253] ([Intel XE#3768])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][254] ([Intel XE#2423]) -> [SKIP][255] ([Intel XE#2385])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][256] ([Intel XE#2370]) -> [SKIP][257] ([Intel XE#2423])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][258] ([Intel XE#2327]) -> [SKIP][259] ([Intel XE#2136] / [Intel XE#2231])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#316]) -> [SKIP][261] ([Intel XE#2136] / [Intel XE#2351])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          [SKIP][262] ([Intel XE#2136]) -> [SKIP][263] ([Intel XE#2327]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#316]) -> [SKIP][265] ([Intel XE#2136])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][266] ([Intel XE#1124]) -> [SKIP][267] ([Intel XE#2136] / [Intel XE#2231])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#1124]) -> [SKIP][269] ([Intel XE#2136] / [Intel XE#2351])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][270] ([Intel XE#2136]) -> [SKIP][271] ([Intel XE#1124]) +19 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][272] ([Intel XE#2136]) -> [SKIP][273] ([Intel XE#607])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][274] ([Intel XE#2136]) -> [SKIP][275] ([Intel XE#610])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][276] ([Intel XE#2136]) -> [SKIP][277] ([Intel XE#2328])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][278] ([Intel XE#610]) -> [SKIP][279] ([Intel XE#2136] / [Intel XE#2231])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#610]) -> [SKIP][281] ([Intel XE#2136])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][282] ([Intel XE#1124]) -> [SKIP][283] ([Intel XE#2136]) +10 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][284] ([Intel XE#2423]) -> [SKIP][285] ([Intel XE#2314] / [Intel XE#2894]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][286] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][287] ([Intel XE#2423])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2191]) -> [SKIP][289] ([Intel XE#2423] / [i915#2575])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][290] ([Intel XE#2423]) -> [SKIP][291] ([Intel XE#367]) +4 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][292] ([Intel XE#367]) -> [SKIP][293] ([Intel XE#2423])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#367]) -> [SKIP][295] ([Intel XE#2423] / [i915#2575])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][296] ([Intel XE#2887]) -> [SKIP][297] ([Intel XE#2136]) +11 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][298] ([Intel XE#2136]) -> [SKIP][299] ([Intel XE#2887]) +26 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][300] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][301] ([Intel XE#2136] / [Intel XE#2231])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2907]) -> [SKIP][303] ([Intel XE#2136])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][304] ([Intel XE#2136]) -> [INCOMPLETE][305] ([Intel XE#3862])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][306] ([Intel XE#2136]) -> [SKIP][307] ([Intel XE#3432]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][308] ([Intel XE#3432]) -> [SKIP][309] ([Intel XE#2136])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-bmg:          [SKIP][310] ([Intel XE#2887]) -> [SKIP][311] ([Intel XE#2136] / [Intel XE#2231])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][313] ([Intel XE#2136] / [Intel XE#2351])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][314] ([Intel XE#2692] / [Intel XE#4010]) -> [INCOMPLETE][315] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][316] ([Intel XE#4010]) -> [DMESG-WARN][317] ([Intel XE#1727] / [Intel XE#3113])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][318] ([Intel XE#2136]) -> [SKIP][319] ([Intel XE#2652] / [Intel XE#787])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][320] ([Intel XE#2724]) -> [SKIP][321] ([Intel XE#2136])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-2/igt@kms_cdclk@mode-transition.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][322] ([Intel XE#2136]) -> [SKIP][323] ([Intel XE#2724])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][324] ([Intel XE#2423]) -> [SKIP][325] ([Intel XE#2252]) +16 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][326] ([Intel XE#2325]) -> [SKIP][327] ([Intel XE#2423]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#306]) -> [SKIP][329] ([Intel XE#2423] / [i915#2575])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][330] ([Intel XE#2423]) -> [SKIP][331] ([Intel XE#2325]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-bmg:          [SKIP][332] ([Intel XE#2252]) -> [SKIP][333] ([Intel XE#3007])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_chamelium_frames@dp-frame-dump.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][334] ([Intel XE#2252]) -> [SKIP][335] ([Intel XE#2423]) +8 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#373]) -> [SKIP][337] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][338] ([Intel XE#2423]) -> [SKIP][339] ([Intel XE#3007]) +13 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_color@ctm-blue-to-red.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_color@degamma:
    - shard-bmg:          [DMESG-WARN][340] ([Intel XE#877]) -> [SKIP][341] ([Intel XE#2423])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_color@degamma.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_color@degamma.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][342] ([Intel XE#1178]) -> [SKIP][343] ([Intel XE#2341])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-4/igt@kms_content_protection@atomic.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][344] ([Intel XE#2341]) -> [SKIP][345] ([Intel XE#2423])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-2/igt@kms_content_protection@content-type-change.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][346] ([Intel XE#2390]) -> [SKIP][347] ([Intel XE#2423])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][348] ([Intel XE#2423]) -> [SKIP][349] ([Intel XE#2390])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][350] ([Intel XE#1178]) -> [SKIP][351] ([Intel XE#2423] / [i915#2575])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@kms_content_protection@lic-type-0.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          [FAIL][352] ([Intel XE#1178]) -> [SKIP][353] ([Intel XE#3007])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][354] ([Intel XE#2423]) -> [SKIP][355] ([Intel XE#2341]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_content_protection@mei-interface.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][356] ([Intel XE#2423]) -> [FAIL][357] ([Intel XE#1178])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_content_protection@srm.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][358] ([Intel XE#2341]) -> [FAIL][359] ([Intel XE#1188])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_content_protection@uevent.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          [SKIP][360] ([Intel XE#2321]) -> [SKIP][361] ([Intel XE#2423]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          [SKIP][362] ([Intel XE#2320]) -> [SKIP][363] ([Intel XE#2423]) +5 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][364] ([Intel XE#3007]) -> [SKIP][365] ([Intel XE#2320])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#2423] / [i915#2575]) -> [SKIP][367] ([Intel XE#455])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x32.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][368] ([Intel XE#2423]) -> [SKIP][369] ([Intel XE#2320]) +7 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][370] ([Intel XE#2423]) -> [SKIP][371] ([Intel XE#2321]) +5 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          [SKIP][372] ([Intel XE#2286]) -> [SKIP][373] ([Intel XE#2423])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][374] ([Intel XE#2423]) -> [SKIP][375] ([Intel XE#2286]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][376] ([Intel XE#2423]) -> [SKIP][377] ([Intel XE#2291]) +2 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][378] ([Intel XE#2423]) -> [DMESG-WARN][379] ([Intel XE#877])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-bmg:          [SKIP][380] ([Intel XE#3007]) -> [SKIP][381] ([Intel XE#2423])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_cursor_legacy@single-bo.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][382] ([Intel XE#2423]) -> [SKIP][383] ([Intel XE#1340])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][384] ([Intel XE#3070]) -> [SKIP][385] ([Intel XE#2136])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][386] ([Intel XE#2136]) -> [SKIP][387] ([Intel XE#2244]) +2 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][388] ([Intel XE#2136]) -> [SKIP][389] ([Intel XE#776])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_fbcon_fbt@psr.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][390] ([Intel XE#2423]) -> [SKIP][391] ([Intel XE#2372])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_feature_discovery@chamelium.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][392] ([Intel XE#2373]) -> [SKIP][393] ([Intel XE#3007])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_feature_discovery@display-3x.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][394] ([Intel XE#2423]) -> [SKIP][395] ([Intel XE#1138])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][396] ([Intel XE#2423]) -> [SKIP][397] ([Intel XE#2375])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][398] ([Intel XE#2423]) -> [SKIP][399] ([Intel XE#2374])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_feature_discovery@psr2.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][400] ([Intel XE#2423]) -> [SKIP][401] ([Intel XE#2316]) +3 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][402] ([Intel XE#2316]) -> [SKIP][403] ([Intel XE#2423])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][404] ([Intel XE#2136]) -> [SKIP][405] ([Intel XE#2293] / [Intel XE#2380]) +8 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][406] ([Intel XE#2136]) -> [SKIP][407] ([Intel XE#2380])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][408] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][409] ([Intel XE#2136]) +2 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][410] ([Intel XE#2136]) -> [SKIP][411] ([Intel XE#2312]) +11 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][412] ([Intel XE#2312]) -> [SKIP][413] ([Intel XE#2311]) +7 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#651]) -> [SKIP][415] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][416] ([Intel XE#2136]) -> [SKIP][417] ([Intel XE#2311]) +49 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][418] ([Intel XE#2311]) -> [SKIP][419] ([Intel XE#2136]) +24 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          [FAIL][420] ([Intel XE#2333]) -> [SKIP][421] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][422] ([Intel XE#2333]) -> [SKIP][423] ([Intel XE#2136]) +7 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][424] ([Intel XE#2312]) -> [FAIL][425] ([Intel XE#2333]) +2 other tests fail
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][426] ([Intel XE#2136]) -> [FAIL][427] ([Intel XE#2333]) +27 other tests fail
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-bmg:          [SKIP][428] ([Intel XE#2136] / [Intel XE#2231]) -> [FAIL][429] ([Intel XE#2333])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][430] ([Intel XE#2311]) -> [SKIP][431] ([Intel XE#2136] / [Intel XE#2231]) +4 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#651]) -> [SKIP][433] ([Intel XE#2136]) +2 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][434] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][435] ([Intel XE#2311]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#2136]) -> [SKIP][437] ([Intel XE#651])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][438] ([Intel XE#2311]) -> [SKIP][439] ([Intel XE#2312]) +4 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][440] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][441] ([Intel XE#2136]) +2 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#653]) -> [SKIP][443] ([Intel XE#2136]) +2 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#653]) -> [SKIP][445] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][446] ([Intel XE#2313]) -> [SKIP][447] ([Intel XE#2136]) +24 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][448] ([Intel XE#2313]) -> [SKIP][449] ([Intel XE#2312]) +1 other test skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][450] ([Intel XE#2136]) -> [SKIP][451] ([Intel XE#2136] / [Intel XE#2231]) +8 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][452] ([Intel XE#2312]) -> [SKIP][453] ([Intel XE#2313]) +6 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][454] ([Intel XE#2136]) -> [SKIP][455] ([Intel XE#2313]) +52 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][456] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][457] ([Intel XE#2313])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#2136]) -> [SKIP][459] ([Intel XE#653])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][460] ([Intel XE#2136]) -> [SKIP][461] ([Intel XE#2352])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][462] ([Intel XE#2136]) -> [SKIP][463] ([Intel XE#2350])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][464] ([Intel XE#2312]) -> [SKIP][465] ([Intel XE#2136]) +4 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#653]) -> [INCOMPLETE][467] ([Intel XE#2594])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-suspend.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][468] ([Intel XE#2423]) -> [SKIP][469] ([Intel XE#2340])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][470] ([Intel XE#2423]) -> [SKIP][471] ([Intel XE#3544])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][472] ([Intel XE#2927]) -> [SKIP][473] ([Intel XE#2136]) +1 other test skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][474] ([Intel XE#2136]) -> [SKIP][475] ([Intel XE#346])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][476] ([Intel XE#2136]) -> [SKIP][477] ([Intel XE#2934])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][478] ([Intel XE#2423]) -> [SKIP][479] ([Intel XE#2486])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_panel_fitting@legacy.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][480] ([Intel XE#2423]) -> [SKIP][481] ([Intel XE#2393]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][482] ([Intel XE#2423]) -> [SKIP][483] ([Intel XE#2493])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][484] ([Intel XE#2423]) -> [SKIP][485] ([Intel XE#2763]) +4 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][486] ([Intel XE#2763]) -> [SKIP][487] ([Intel XE#2423]) +2 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][488] ([Intel XE#2136]) -> [SKIP][489] ([Intel XE#870]) +1 other test skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_pm_backlight@fade.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][490] ([Intel XE#870]) -> [SKIP][491] ([Intel XE#2136])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][492] ([Intel XE#2136]) -> [SKIP][493] ([Intel XE#2392])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][494] ([Intel XE#2136]) -> [SKIP][495] ([Intel XE#3309])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [FAIL][496] ([Intel XE#1430]) -> [SKIP][497] ([Intel XE#2136])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][498] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][499] ([Intel XE#2446])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][500] ([Intel XE#2446]) -> [SKIP][501] ([Intel XE#1439] / [Intel XE#836])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#2136]) -> [SKIP][503] ([Intel XE#1489])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
    - shard-bmg:          [SKIP][504] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][505] ([Intel XE#1489])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#1489]) -> [SKIP][507] ([Intel XE#2136])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][508] ([Intel XE#2136]) -> [SKIP][509] ([Intel XE#1489]) +16 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][510] ([Intel XE#1489]) -> [SKIP][511] ([Intel XE#2136]) +7 other tests skip
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][512] ([Intel XE#2387]) -> [SKIP][513] ([Intel XE#2136])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][514] ([Intel XE#2136]) -> [SKIP][515] ([Intel XE#2387]) +1 other test skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][516] ([Intel XE#2136]) -> [SKIP][517] ([Intel XE#2234] / [Intel XE#2850]) +23 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][518] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][519] ([Intel XE#2234] / [Intel XE#2850])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#2136]) -> [SKIP][521] ([Intel XE#2850] / [Intel XE#929])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_psr@fbc-psr-primary-render.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][522] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][523] ([Intel XE#2136]) +8 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][525] ([Intel XE#2136]) +1 other test skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][526] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][527] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][529] ([Intel XE#2136] / [Intel XE#2351])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@kms_psr@pr-sprite-plane-onoff.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][530] ([Intel XE#2136]) -> [SKIP][531] ([Intel XE#2414]) +1 other test skip
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][532] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][533] ([Intel XE#2423]) +1 other test skip
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][534] ([Intel XE#3007]) -> [SKIP][535] ([Intel XE#2330])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#2423] / [i915#2575]) -> [SKIP][537] ([Intel XE#1127])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][538] ([Intel XE#2423]) -> [SKIP][539] ([Intel XE#3414] / [Intel XE#3904])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][540] ([Intel XE#2426]) -> [SKIP][541] ([Intel XE#2423]) +1 other test skip
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#1500]) -> [SKIP][543] ([Intel XE#362])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][544] ([Intel XE#2423]) -> [SKIP][545] ([Intel XE#2450])
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][546] ([Intel XE#2423]) -> [SKIP][547] ([Intel XE#1499]) +2 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_vrr@flip-suspend.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][548] ([Intel XE#455]) -> [SKIP][549] ([Intel XE#2423] / [i915#2575])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@kms_vrr@flipline.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_vrr@flipline.html
    - shard-bmg:          [SKIP][550] ([Intel XE#1499]) -> [SKIP][551] ([Intel XE#3007])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@kms_vrr@flipline.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][552] ([Intel XE#2423]) -> [SKIP][553] ([Intel XE#2168])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@kms_vrr@lobf.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][554] ([Intel XE#1499]) -> [SKIP][555] ([Intel XE#2423]) +1 other test skip
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          [SKIP][556] ([Intel XE#2423]) -> [SKIP][557] ([Intel XE#756])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][558] ([Intel XE#3007]) -> [SKIP][559] ([Intel XE#756])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@kms_writeback@writeback-invalid-parameters.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#2423] / [i915#2575]) -> [SKIP][561] ([Intel XE#756])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][562] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][563] ([Intel XE#2423]) +1 other test skip
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][565] ([Intel XE#1130])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#1130]) -> [SKIP][567] ([Intel XE#1280] / [Intel XE#455])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][568] ([Intel XE#2504]) -> [SKIP][569] ([Intel XE#1130])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-connect:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#2905]) -> [SKIP][571] ([Intel XE#1130])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@xe_eudebug@basic-connect.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-bmg:          [SKIP][572] ([Intel XE#1130]) -> [SKIP][573] ([Intel XE#3889]) +1 other test skip
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][574] ([Intel XE#1130]) -> [SKIP][575] ([Intel XE#2905]) +16 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#1130]) -> [SKIP][577] ([Intel XE#2905])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#3889]) -> [SKIP][579] ([Intel XE#1130])
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-bmg:          [SKIP][580] ([Intel XE#3889]) -> [SKIP][581] ([Intel XE#1130])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          [SKIP][582] ([Intel XE#2905]) -> [SKIP][583] ([Intel XE#1130]) +8 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          [SKIP][584] ([Intel XE#2322]) -> [SKIP][585] ([Intel XE#1130]) +6 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][586] ([Intel XE#1130]) -> [SKIP][587] ([Intel XE#2322]) +10 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#288]) -> [SKIP][589] ([Intel XE#1130]) +2 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][590] ([Intel XE#1130]) -> [SKIP][591] ([Intel XE#586])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@xe_mmap@small-bar.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@xe_mmap@small-bar.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][592] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][593] ([Intel XE#1130])
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@xe_oa@invalid-map-oa-buffer.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     [SKIP][594] ([Intel XE#1130]) -> [SKIP][595] ([Intel XE#2541] / [Intel XE#3573])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_oa@syncs-ufence-wait-cfg.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][596] ([Intel XE#2248]) -> [SKIP][597] ([Intel XE#1130])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-6/igt@xe_oa@unprivileged-single-ctx-counters.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][598] ([Intel XE#1130]) -> [SKIP][599] ([Intel XE#2245])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][600] ([Intel XE#1130]) -> [SKIP][601] ([Intel XE#2284]) +2 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][602] ([Intel XE#2284]) -> [SKIP][603] ([Intel XE#1130])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-3/igt@xe_pm@s3-d3cold-basic-exec.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-dg2-set2:     [SKIP][604] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][605] ([Intel XE#1130])
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][606] ([Intel XE#1130]) -> [SKIP][607] ([Intel XE#579])
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][608] ([Intel XE#944]) -> [SKIP][609] ([Intel XE#1130]) +1 other test skip
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][610] ([Intel XE#1130]) -> [SKIP][611] ([Intel XE#944]) +4 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
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
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8198 -> IGTPW_12460
  * Linux: xe-2508-9033a16532f74ae36c48d729d0855a6e189039df -> xe-2513-aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2

  IGTPW_12460: 783d10928eca7563a8811a3a3fa90b3d693b6916 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2508-9033a16532f74ae36c48d729d0855a6e189039df: 9033a16532f74ae36c48d729d0855a6e189039df
  xe-2513-aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2: aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/index.html

--===============6114185370831974730==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_fbcon_fbt: Add skip conditio=
n for bmg platform (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/141281/">https://patchwork.freedesktop.org/series/141281/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12460/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12460/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8198_full -&gt; XEIGTPW_12460_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12460_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12460_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
460_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic@atomic-plane-damage@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_atomic@atomic-plane-damage@p=
ipe-a-dp-2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x256.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1246=
0/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x256.html">INCOMPLETE</=
a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ab-dp2-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12460/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html=
">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1246=
0/shard-lnl-7/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</=
a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shar=
d-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate-interruptible@=
b-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate-inte=
rruptible@b-hdmi-a6.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_atomic@atomic-plane-damage.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel X=
E#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12460/shard-bmg-2/igt@kms_atomic@atomic-plane-damage.html">INCOMPLETE</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard=
-bmg-2/igt@kms_fbcon_fbt@fbc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
60/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12460/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12460/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-r=
anges.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_sriov_auto_provisioning@fair-allocation}:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@xe_sriov_auto_provisioning@fair-allocation.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12460/shard-bmg-3/igt@xe_sriov_auto_provisioning@fair-allocat=
ion.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8198_full and XEIGTPW_12460=
_full:</p>
<h3>New IGT tests (11)</h3>
<ul>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a6-dp4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12460_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/sh=
ard-bmg-7/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a=
>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-2/igt@fbdev@info.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@fbdev@info=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@intel_hwmon@hwmon-write.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/sh=
ard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-0.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_bw@connected-linear-tiling=
-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled=
-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-ti=
led-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12460/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-d-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-1/igt@kms_chamelium_color@ctm-negative=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-cha=
nge-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-resol=
ution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-6/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_content_protection@srm@pipe-=
a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_content_protection@uevent@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-1/igt@kms_cursor_crc@cursor-random-max=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
60/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel =
XE#3007</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-8/igt@kms_draw_crc@draw-method-blt.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bm=
g-7/igt@kms_draw_crc@draw-method-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_feature_discovery@display-=
3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_flip@2x-dpms-vs-vblank-race-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg=
-6/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12460/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2597">Intel XE#2597</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-=
7/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +75 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-=
interruptible@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2460/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">In=
tel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
60/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12460/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate-interruptible.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12460/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12460/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate-interruptible@=
a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate-inte=
rruptible@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp=
-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#23=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel X=
E#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xt=
ile-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-16bpp-xtile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#14=
01</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-i=
ndfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcps=
r-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12460/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012=
">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-wi=
th-rotation.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-fa=
ctor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +14 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-4/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-2/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Inte=
l XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-2/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@k=
ms_pm_rpm@cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/=
igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2893">Intel XE#2893</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-3/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"=
>Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@xe_compute_preempt@compute-pre=
empt-many@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-8/igt@xe_eudebug@basic-client.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905=
">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@xe_eudebug_online@interrupt-al=
l-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-=
reopen.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12460/shard-dg2-433/igt@xe_evict_ccs@evict-overcommit-parallel-=
nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1130">Intel XE#1130</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-st=
andalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-1/igt@xe_exec_basic@multigpu-once-bind=
execqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_exec_fault_mode@once-invali=
d-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-6/igt@xe_live_ktest@xe_bo.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">In=
tel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@xe_oa@non-privileged-access-va=
ddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-=
vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-5/igt@xe_pm@d3cold-mmap-vram.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-435/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-4=
66/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-=
dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#=
1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-7/igt@xe_pm@s3-multiple-execs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584"=
>Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@xe_query@multigpu-query-gt-lis=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-lnl-2/igt@xe_query@multigpu-query-gt-list.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-time=
out.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12460/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-=
timeout.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1130">Intel XE#1130</a>) +160 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1246=
0/shard-bmg-8/igt@core_hotunplug@hotrebind.html">PASS</a> +2 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/345=
3">Intel XE#3453</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12460/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/i=
gt@fbdev@eof.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-fencing-internal-panels.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-4/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing-internal-panels.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-18=
0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_big_fb@4-tiled-ma=
x-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +29 other tests pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-0.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12460/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb=
-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475=
">Intel XE#1475</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12460/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-435/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interru=
ptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@kms_flip@2=
x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> +1=
 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@kms_flip@2x-flip=
-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +6 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-rac=
e-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Int=
el XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12460/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">=
Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12460/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@kms_flip@flip-vs-expired-vbl=
ank@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4t=
ile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_fl=
ip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> +1 o=
ther test pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-=
4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@kms_flip_scaled_=
crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">I=
ntel XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12460/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PA=
SS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_properties@connector-properties-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12460/shard-bmg-6/igt@kms_properties@connector-properties-leg=
acy.html">PASS</a> +134 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_sequence@get-idle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/s=
hard-bmg-4/igt@kms_sequence@get-idle.html">PASS</a> +6 other tests pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_sequence@get-idle.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12460/shard-dg2-433/igt@kms_sequence@get-idle.html">PASS</a> +6 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12460/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1246=
0/shard-bmg-4/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-lnl-7/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0=
-system-system.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2771">Intel XE#2771</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-lnl-1/igt@xe_ccs@suspen=
d-resume@tile64-compressed-compfmt0-system-system.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130=
">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12460/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.ht=
ml">PASS</a> +347 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1246=
0/shard-bmg-4/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8198/shard-dg2-434/igt@xe_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8198/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-=
dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-436/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8198/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8198/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8198/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-43=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8198/shard-dg2-435/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_819=
8/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-434/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8198/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8198/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-463/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8198/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8198/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-=
433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
60/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12460/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/sh=
ard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12460/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-435/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12460/shard-dg2-435/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-d=
g2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12460/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12460/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-43=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460=
/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12460/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@xe_module_load@many-reload.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#35=
46</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
460/shard-bmg-5/igt@xe_module_load@many-reload.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2097152:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@xe_vm@large-misaligned-binds-2097152.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"=
>Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12460/shard-dg2-434/igt@xe_vm@large-misaligned-binds-2097152.html=
">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE=
#3084</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12460/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small=
-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12460/shard-bmg-5/igt@kms_async_flips@invalid-async-flip-atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mut=
able-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing-internal-panels.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12460/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">In=
tel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12460/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12460/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Inte=
l XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">I=
ntel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12460/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12460/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-435/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">In=
tel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12460/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12460/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">In=
tel XE#1124</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12460/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
60/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610"=
>Intel XE#610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12460/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/61=
0">Intel XE#610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12460/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0=
-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_bw@connecte=
d-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840=
x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_bw@connected-linear-t=
iling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12460/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x14=
40p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12460/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-1920x1080p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12460/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc=
-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-mt=
l-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/26=
52">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-=
tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2907">Intel XE#2907</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-ln=
l-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bm=
g-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887=
">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12460/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y=
f-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2692">Intel XE#2692</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_ccs@rand=
om-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#31=
24</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/401=
0">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_ccs@ra=
ndom-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12460/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2652">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-2/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#272=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
60/shard-bmg-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1246=
0/shard-bmg-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12460/shard-bmg-4/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">=
Intel XE#2252</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#=
2325</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12460/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">=
Intel XE#306</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12460/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12460/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">=
Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Int=
el XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12460/shard-bmg-3/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">In=
tel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"=
>Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12460/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
73">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12460/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-after-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_color@ctm-blue-to-red.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
60/shard-bmg-3/igt@kms_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +=
13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_color@degamma.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/=
shard-bmg-7/igt@kms_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-4/igt@kms_content_protection@atomic.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12460/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-2/igt@kms_content_protection@content-type-change.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
341">Intel XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12460/shard-bmg-7/igt@kms_content_protection@content-type-cha=
nge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/239=
0">Intel XE#2390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12460/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/242=
3">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12460/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12460/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12460/shard-bmg-3/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Inte=
l XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12460/shard-bmg-1/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341=
">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_content_protection@srm.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
460/shard-bmg-4/igt@kms_content_protection@srm.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12460/shard-bmg-4/igt@kms_content_protection@uevent.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#118=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321=
">Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12460/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x170.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">I=
ntel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12460/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Int=
el XE#3007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12460/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">In=
tel XE#2320</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">I=
ntel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12460/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320=
">Intel XE#2320</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12460/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
21">Intel XE#2321</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-=
legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2286">Intel XE#2286</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-=
varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_cursor_legacy@bas=
ic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12460/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_cursor_lega=
cy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE=
#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_cursor_legacy@single-bo.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3=
007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2460/shard-bmg-7/igt@kms_cursor_legacy@single-bo.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel=
 XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12460/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel =
XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">=
Intel XE#3070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12460/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
460/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard=
-bmg-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12460/shard-bmg-3/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE=
#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12460/shard-bmg-3/igt@kms_feature_discovery@display-3x.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel =
XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel=
 XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12460/shard-bmg-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel =
XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12460/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
460/shard-bmg-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12460/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-y=
ftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_flip_scaled=
_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380"=
>Intel XE#2380</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4t=
iledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_flip_s=
caled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Int=
el XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@k=
ms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multi=
draw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_frontbuffer_track=
ing@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_frontbuffer_tra=
cking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb=
101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multid=
raw.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1=
p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +27 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_frontbuffer_trackin=
g@fbc-modesetfrombusy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_frontbuffe=
r_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/223=
1">Intel XE#2231</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_frontbuf=
fer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shr=
fb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_frontbuffer_=
tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-ind=
fb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_front=
buffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_frontbuffer_t=
racking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pr=
i-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_frontbuffer_t=
racking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#22=
31</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcps=
r-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_frontbuffer_=
tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mm=
ap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_frontbuffer_tracking@f=
bcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/213=
6">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12460/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12460/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">=
Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12460/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2460/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2460/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE=
#2927</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12460/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12460/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
6">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ult=
ra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1246=
0/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
460/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#=
2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12460/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-wi=
th-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-2/igt@kms_plane_scaling@=
plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_plane_scalin=
g@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/s=
hard-bmg-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Inte=
l XE#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12460/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard=
-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12460/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#330=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shar=
d-bmg-7/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Int=
el XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Inte=
l XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel =
XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12460/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE=
#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12460/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-update-sf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1489">Intel XE#1489</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-up=
date-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-update-continuous=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-updat=
e-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1489">Intel XE#1489</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-are=
a-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-=
plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#23=
87</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
460/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12460/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2=
387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
60/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel =
XE#2850</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12460/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12460/shard-dg2-436/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel =
XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Int=
el XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">I=
ntel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE=
#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12460/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-436/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel =
XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12460/shard-dg2-433/igt@kms_psr@pr-sprite-plane-onoff.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12460/shard-bmg-5/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Inte=
l XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3904">Intel XE#3904</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12460/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3007">Intel XE#3007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12460/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-466/igt@kms_rotation_crc@=
primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12460/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-r=
eflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12460/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12460/shard-dg2-463/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel X=
E#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12460/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2=
450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/sh=
ard-bmg-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-=
dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-=
bmg-3/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-=
1/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12460/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12460/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb210101=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@kms_writeback@writeback-invalid-parameters.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
007">Intel XE#3007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12460/shard-bmg-5/igt@kms_writeback@writeback-invalid-paramet=
ers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/756">Intel XE#756</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12460/shard-dg2-434/igt@kms_writeback@writeba=
ck-invalid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">I=
ntel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2849">Intel XE#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@sriov_basic@enable-vfs-autoprob=
e-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">I=
ntel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_compute_preempt@compute-pree=
mpt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12460/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-man=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504"=
>Intel XE#2504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12460/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@xe_eudebug@basic-connect.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#29=
05</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
460/shard-dg2-433/igt@xe_eudebug@basic-connect.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@xe_eudebug@basic-vm-access-parameters-userptr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12460/shard-bmg-2/igt@xe_eudebug@basic-vm-access-parameter=
s-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12460/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-disc=
overy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +16 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-metadata-discovery.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12460/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-metadata-=
discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3889">Intel XE#3889</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-dela=
y-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1130">Intel XE#1130</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/38=
89">Intel XE#3889</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12460/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ac=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-ta=
rget-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@xe_eudebug_online@writes=
-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-n=
ull-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard-bmg-7/igt@xe_exec_basic@multi=
gpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130=
">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12460/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2322">Intel XE#2322</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
288">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12460/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-=
imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@xe_mmap@small-bar.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/shard=
-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-435/igt@xe_oa@invalid-map-oa-buffer.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE=
#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3573">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12460/shard-dg2-433/igt@xe_oa@invalid-map-oa-buffer.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130=
">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12460/shard-dg2-435/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#254=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573=
">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-6/igt@xe_oa@unprivileged-single-ctx-counters.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248"=
>Intel XE#2248</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12460/shard-bmg-7/igt@xe_oa@unprivileged-single-ctx-counters.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12460/s=
hard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel X=
E#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12460/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2=
284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-3/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#22=
84</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
460/shard-bmg-3/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#=
2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
66">Intel XE#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12460/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">In=
tel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2460/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel =
XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12460/shard-bmg-7/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8198/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12460/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8198 -&gt; IGTPW_12460</li>
<li>Linux: xe-2508-9033a16532f74ae36c48d729d0855a6e189039df -&gt; xe-2513-a=
ceaa93d2b1d5d5727652a02f5f0742dd9e07ac2</li>
</ul>
<p>IGTPW_12460: 783d10928eca7563a8811a3a3fa90b3d693b6916 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2508-9033a16532f74ae36c48d729d0855a6e189039df: 9033a16532f74ae36c48d72=
9d0855a6e189039df<br />
  xe-2513-aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2: aceaa93d2b1d5d5727652a0=
2f5f0742dd9e07ac2</p>

</body>
</html>

--===============6114185370831974730==--
