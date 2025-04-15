Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B055EC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 05:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EC910E04C;
	Tue, 15 Apr 2025 05:08:32 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0595110E002;
 Tue, 15 Apr 2025 05:08:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1864325937971116783=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_new_test_to_validate_a?=
 =?utf-8?q?daptive_sharpness_filter_=28rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 15 Apr 2025 05:08:31 -0000
Message-ID: <174469371197.3906.1222684001718373100@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250414111657.794484-1-swati2.sharma@intel.com>
In-Reply-To: <20250414111657.794484-1-swati2.sharma@intel.com>
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

--===============1864325937971116783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add new test to validate adaptive sharpness filter (rev14)
URL   : https://patchwork.freedesktop.org/series/130218/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8318_FULL -> XEIGTPW_12971_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12971_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12971_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12971_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +10 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][5] -> [FAIL][6] +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html

  * igt@kms_sharpness_filter@filter-toggle (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][7] +13 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][8] +15 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@xe_vm@munmap-style-unbind-userptr-many-front:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@xe_vm@munmap-style-unbind-userptr-many-front.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][10] ([Intel XE#2321]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  
New tests
---------

  New tests have been introduced between XEIGT_8318_FULL and XEIGTPW_12971_FULL:

### New IGT tests (16) ###

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_sharpness_filter@filter-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.00] s

  * igt@kms_sharpness_filter@filter-dpms:
    - Statuses : 3 skip(s)
    - Exec time: [0.00] s

  * igt@kms_sharpness_filter@filter-formats:
    - Statuses : 3 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_sharpness_filter@filter-modifiers:
    - Statuses : 3 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_sharpness_filter@filter-rotations:
    - Statuses : 3 skip(s)
    - Exec time: [0.00] s

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_sharpness_filter@filter-scaler-upscale:
    - Statuses : 3 skip(s)
    - Exec time: [0.00] s

  * igt@kms_sharpness_filter@filter-strength:
    - Statuses : 2 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_sharpness_filter@filter-suspend:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_sharpness_filter@filter-tap:
    - Statuses : 3 skip(s)
    - Exec time: [0.00] s

  * igt@kms_sharpness_filter@filter-toggle:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - Statuses : 3 skip(s)
    - Exec time: [0.00] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - Statuses : 3 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12971_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:
    - shard-lnl:          [PASS][12] -> [ABORT][13] ([Intel XE#4624])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-6/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#3719] / [Intel XE#911]) +3 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#3768])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2327])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#316]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1407]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2328])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#607])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1428])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1124]) +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#2191])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2314] / [Intel XE#2894])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1512]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#367]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#367])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#367])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#787]) +188 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#455] / [Intel XE#787]) +39 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2669]) +11 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2887]) +6 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2887]) +8 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#3432])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][42] -> [INCOMPLETE][43] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][44] -> [INCOMPLETE][45] ([Intel XE#3124])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][46] -> [DMESG-WARN][47] ([Intel XE#1727] / [Intel XE#3113])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#4417]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#4416]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2325])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#306])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#306]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-8/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#373]) +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2252]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#373]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#3278])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#1178])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#307])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2390])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][60] ([Intel XE#1178])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#3304])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2341])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2321])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#308]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1424]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2291]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#309]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [PASS][68] -> [SKIP][69] ([Intel XE#309]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2291]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2286])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1508])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#1340])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([i915#3804])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#3009])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-8/igt@kms_dp_aux_dev.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#2244]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#4422])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#776])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][82] -> [SKIP][83] ([Intel XE#310]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-434/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][84] ([Intel XE#2882]) +3 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][85] ([Intel XE#301]) +2 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2316])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1421]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#310])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#2316]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#301]) +2 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][93] -> [FAIL][94] ([Intel XE#301] / [Intel XE#3149])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          [PASS][95] -> [FAIL][96] ([Intel XE#2882]) +3 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1401]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1397] / [Intel XE#1745])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1397])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2293]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2311]) +12 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#656]) +25 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#4141]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#656]) +7 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][107] -> [SKIP][108] ([Intel XE#656]) +7 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1469])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#651]) +17 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#651]) +11 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2313]) +12 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2312]) +6 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2352])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1158])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#653]) +10 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1503])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#346])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][119] -> [SKIP][120] ([Intel XE#3012])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#4298])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2925]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][123] -> [FAIL][124] ([Intel XE#616]) +1 other test fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-432/igt@kms_plane_cursor@viewport.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#599])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     [PASS][126] -> [SKIP][127] ([Intel XE#4596])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-none.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#4596])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][129] -> [SKIP][130] ([Intel XE#2571])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#2763]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2763]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2763]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#870])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2938])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][137] -> [FAIL][138] ([Intel XE#718])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][139] -> [SKIP][140] ([Intel XE#836])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#2893]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#4608]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#1489]) +6 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#2893] / [Intel XE#4608]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#1489]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2387])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1406]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#4609]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#2939])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#3414]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#1127])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#3414] / [Intel XE#3904])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#3414] / [Intel XE#3904])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#2413] / [Intel XE#374])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#374]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_sharpness_filter@filter-toggle (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#455]) +20 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][160] -> [FAIL][161] ([Intel XE#4459]) +1 other test fail
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#1499]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#756])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#4497])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#2905]) +7 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-466/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#2905]) +6 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#2905] / [Intel XE#4259])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2905]) +6 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#688]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#1392]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2322]) +4 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#1392]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][174] -> [SKIP][175] ([Intel XE#1392]) +6 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#288]) +15 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#2229])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#560])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203]) -> ([PASS][204], [PASS][205], [PASS][206], [PASS][207], [SKIP][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229]) ([Intel XE#378])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-3/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-3/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-8/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-8/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-4/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-4/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-7/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-7/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-6/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-6/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-2/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-2/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-6/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-5/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-1/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-3/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-1/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-7/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-7/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-2/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-4/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-5/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-2/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-8/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-8/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-8/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-2/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-2/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@xe_module_load@load.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][230] ([Intel XE#2248])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][232] ([Intel XE#979])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#1061])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][235] ([Intel XE#584])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-2/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#4733])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][237] ([Intel XE#4733]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#944]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#4130])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][240] ([Intel XE#3342])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [DMESG-WARN][241] -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#367]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][245] ([Intel XE#3862]) -> [PASS][246] +1 other test pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#309]) -> [PASS][248] +3 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#4354]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#4331]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][253] ([Intel XE#2373]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#310]) -> [PASS][256] +2 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][257] ([Intel XE#2316]) -> [PASS][258] +5 other tests pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@dpms-off-confusion@d-dp4:
    - shard-dg2-set2:     [FAIL][259] -> [PASS][260] +2 other tests pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-466/igt@kms_flip@dpms-off-confusion@d-dp4.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-466/igt@kms_flip@dpms-off-confusion@d-dp4.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][261] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#656]) -> [PASS][264] +4 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          [ABORT][265] ([Intel XE#4624]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@static-swap:
    - shard-dg2-set2:     [FAIL][267] ([Intel XE#4426]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-466/igt@kms_hdr@static-swap.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][269] ([Intel XE#3012]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][271] ([Intel XE#1435]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#455]) -> [PASS][274] +1 other test pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vblank@wait-idle-hang:
    - shard-bmg:          [FAIL][275] -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@kms_vblank@wait-idle-hang.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_vblank@wait-idle-hang.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1392]) -> [PASS][278] +5 other tests pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [SKIP][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [DMESG-WARN][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304]) ([Intel XE#2457]) -> ([PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-3/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-3/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-1/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-1/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-3/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-2/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-2/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-1/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-2/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-1/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-3/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-8/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-2/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-8/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-8/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-8/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [DMESG-WARN][329] ([Intel XE#569]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@xe_pm@s3-mocs.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@xe_pm@s3-mocs.html

  
#### Warnings ####

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][332] ([Intel XE#787]) +9 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#787]) -> [SKIP][334] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][335] ([Intel XE#1727] / [Intel XE#3113]) -> [INCOMPLETE][336] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#4418]) -> [SKIP][338] ([Intel XE#4440])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][339] ([Intel XE#1178]) -> [SKIP][340] ([Intel XE#2341]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-3/igt@kms_content_protection@legacy.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][341] ([Intel XE#2341]) -> [FAIL][342] ([Intel XE#1178])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][343] ([Intel XE#2316]) -> [FAIL][344] ([Intel XE#2882])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][345] ([Intel XE#3321]) -> [SKIP][346] ([Intel XE#2316]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#310]) -> [FAIL][348] ([Intel XE#301])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][349] ([Intel XE#301]) -> [FAIL][350] ([Intel XE#301] / [Intel XE#3149])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][351] ([Intel XE#2311]) -> [SKIP][352] ([Intel XE#2312]) +20 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][353] ([Intel XE#2312]) -> [SKIP][354] ([Intel XE#4141]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][355] ([Intel XE#4141]) -> [SKIP][356] ([Intel XE#2312]) +11 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#651]) -> [SKIP][358] ([Intel XE#656]) +14 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#656]) -> [SKIP][360] ([Intel XE#651]) +13 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][361] ([Intel XE#2312]) -> [SKIP][362] ([Intel XE#2311]) +8 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][363] ([Intel XE#2312]) -> [SKIP][364] ([Intel XE#2313]) +13 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#653]) -> [SKIP][366] ([Intel XE#656]) +16 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][367] ([Intel XE#2313]) -> [SKIP][368] ([Intel XE#2312]) +22 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#656]) -> [SKIP][370] ([Intel XE#653]) +15 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][371] ([Intel XE#4596]) -> [SKIP][372] ([Intel XE#2493])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][373] ([Intel XE#2493]) -> [SKIP][374] ([Intel XE#4596])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][375] ([Intel XE#1729]) -> [SKIP][376] ([Intel XE#362])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
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
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4259
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
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
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8318 -> IGTPW_12971
  * Linux: xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa -> xe-2950-ee6ca91bfc76e36e7520d3603772b55fcc3837b8

  IGTPW_12971: a5036b2d58e358e42f218052c2fc254b38d407e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8318: 6a33ce105328c5c7cdc63cdd799698638f20db28 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa: 7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa
  xe-2950-ee6ca91bfc76e36e7520d3603772b55fcc3837b8: ee6ca91bfc76e36e7520d3603772b55fcc3837b8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/index.html

--===============1864325937971116783==
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
<tr><td><b>Series:</b></td><td>Add new test to validate adaptive sharpness =
filter (rev14)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/130218/">https://patchwork.freedesktop.org/series/130218/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12971/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12971/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8318_FULL -&gt; XEIGTPW_12971_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12971_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12971_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
971_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xt=
ile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-16bpp-xtile-downscaling.html">DMESG-WARN</a> +10 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-=
bmg-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-=
c-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4@pipe-a=
-dp-2-pipe-c-hdmi-a-3.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_sharpness_filter@filter-togg=
le.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_sharpness_filter@invalid-fil=
ter-with-scaling-mode.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-many-front:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@xe_vm@munmap-style-unbind-userpt=
r-many-front.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-onscreen-512x170:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"=
>Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12971/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html=
">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8318_FULL and XEIGTPW_12971=
_FULL:</p>
<h3>New IGT tests (16)</h3>
<ul>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-modifiers:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-rotations:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12971_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-lnl-6/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-=
display-off.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12971/shard-lnl-5/igt@intel_sysfs_debugfs@xe-debugfs-read-=
all-entries-display-off.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4624">Intel XE#4624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12971/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-fli=
p-events-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel X=
E#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
8">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920=
x1080p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12971/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12971/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2=
160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_bw@linear-tiling-1-display=
s-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled=
-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +188 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tile=
d-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +39 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +11 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180=
-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12971/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12971/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-m=
c-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12971/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe=
-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_chamelium_color@ctm-limited-=
range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-466/igt@kms_chamelium_color@ctm-max.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-8/igt@kms_chamelium_color@gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
6">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-=
nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_chamelium_frames@vga-frame-d=
ump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-with-e=
nabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-2/igt@kms_content_protection@atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_content_protection@atomic@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_content_protection@dp-mst-=
lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-move=
ment-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12971/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shar=
d-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6b=
pc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-8/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_dp=
_aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-434/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12971/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/310">Intel XE#310</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank@b=
c-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2882">Intel XE#2882</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/142=
1">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-=
4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12971/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1297=
1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
49">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard=
-bmg-2/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +3 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +25 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-i=
ndfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-til=
ing-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_frontbuffer_tracking@plane=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_joiner@basic-big-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/sha=
rd-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_joiner@switch-modeset-ultr=
a-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2925">Intel XE#2925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-432/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2=
-432/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
99">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-none.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/s=
hard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1297=
1/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE=
#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_plane_scaling@planes-unity=
-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_plane_scaling@planes-unity=
-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_pm_backlight@bad-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971=
/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#83=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-n=
o-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-mo=
ve-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-mo=
ve@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4609">Intel XE#4609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_psr_stress_test@invalidate=
-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_scaling_modes@scaling-mode-n=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2413">Intel XE#2413</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/374">Intel XE#374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@kms_scaling_modes@scaling-mode-n=
one@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/374">Intel XE#374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_sharpness_filter@filter-to=
ggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_vrr@flip-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Inte=
l XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@xe_compute_preempt@compute-pre=
empt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@xe_eu_stall@unprivileged-acces=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-466/igt@xe_eudebug@basic-close.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-metadat=
a-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@xe_eudebug@discovery-race-sigint=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4259">Intel XE#4259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@xe_eudebug_online@single-step.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-st=
andalone-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-b=
asic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-b=
asic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-invalidate-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@xe_exec_basic@multigpu-onc=
e-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@xe_exec_fault_mode@twice-inval=
id-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_va=
lidate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/560=
">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8318/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8318/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8318/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8318/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8318/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8318/shard-lnl-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-ln=
l-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8318/shard-lnl-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard=
-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/sh=
ard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
318/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8318/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8318/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12971/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/s=
hard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@xe_module_load@loa=
d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12971/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12971/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12971/shard-lnl-4/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-l=
nl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1297=
1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12971/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12971/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-5/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shar=
d-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2971/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-6/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12971/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12971/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Inte=
l XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-1/igt@xe_oa@oa-tlb-invalidate.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248=
">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@xe_oa@polling-small-buf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979=
">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-5/igt@xe_peer2peer@read.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Inte=
l XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-lnl-2/igt@xe_pm_residency@cpg-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-=
rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@xe_query@multigpu-query-engine=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@xe_sriov_auto_provisioning@sel=
fconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-6/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-W=
ARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
971/shard-bmg-3/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840=
x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3862">Intel XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12971/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-tog=
gle.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">In=
tel XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12971/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-sst.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331=
">Intel XE#4331</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12971/shard-dg2-434/igt@kms_dp_linktrain_fallback@dp-fallback.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12971/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">In=
tel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12971/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS=
</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel X=
E#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12971/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> +5 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-466/igt@kms_flip@dpms-off-confusion@d-dp4.html">FAIL</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/s=
hard-dg2-466/igt@kms_flip@dpms-off-confusion@d-dp4.html">PASS</a> +2 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel X=
E#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12971/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-ind=
fb-draw-render.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4624">Intel XE#4624</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-lnl-3/igt@kms_frontbuffer_tr=
acking@psr-1p-primscrn-spr-indfb-draw-render.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-466/igt@kms_hdr@static-swap.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426">Intel XE#4426</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/s=
hard-dg2-464/igt@kms_hdr@static-swap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3012">Intel XE#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-j=
oiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_setmode@invalid-clone-single-cr=
tc-stealing.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_setmode@invalid-clone-single-=
crtc-stealing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-6/igt@kms_vblank@wait-idle-hang.html">FAIL</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4=
/igt@kms_vblank@wait-idle-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-4=
35/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8318/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8318/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8318/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8318/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8318/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6=
/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8318/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bm=
g-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8318/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard=
-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/sh=
ard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8318/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8318/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8318/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8318/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8318/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#=
2457</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12971/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12971/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12971/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bm=
g-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12971/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12971/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard=
-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
971/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12971/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12971/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12971/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-6/igt@xe_pm@s3-mocs.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard=
-bmg-2/igt@xe_pm@s3-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-h=
dmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-435/igt@kms_ccs@ccs-on=
-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-c=
c@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_ccs@crc-prim=
ary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"=
>Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3124">Intel XE#3124</a>) +1 other test incomplete</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418=
">Intel XE#4418</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12971/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-3/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12971/shard-bmg-4/igt@kms_content_protection@legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12971/shard-bmg-2/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel X=
E#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12971/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2=
882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12971/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12971/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149=
">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multi=
draw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +20 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-432/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) =
+13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-ind=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-2/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-mul=
tidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12971/shard-bmg-3/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cu=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-464/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12971/shard-bmg-4/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +22 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12971/shard-dg2-434/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12971/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2=
493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel =
XE#2493</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12971/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE=
#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8318/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12971/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
362">Intel XE#362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8318 -&gt; IGTPW_12971</li>
<li>Linux: xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa -&gt; xe-2950-e=
e6ca91bfc76e36e7520d3603772b55fcc3837b8</li>
</ul>
<p>IGTPW_12971: a5036b2d58e358e42f218052c2fc254b38d407e2 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8318: 6a33ce105328c5c7cdc63cdd799698638f20db28 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa: 7fabc0c4629ff44d0472fa7=
0ed6ae5caa334c3aa<br />
  xe-2950-ee6ca91bfc76e36e7520d3603772b55fcc3837b8: ee6ca91bfc76e36e7520d36=
03772b55fcc3837b8</p>

</body>
</html>

--===============1864325937971116783==--
