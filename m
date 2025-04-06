Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0291BC36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 18:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BC210E11B;
	Sun,  6 Apr 2025 18:47:31 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CF810E059;
 Sun,  6 Apr 2025 18:47:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6030157795039704956=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5Bv3?=
 =?utf-8?q?=2C01/19=5D_drm-uapi/amdgpu=3A_sync_with_drm-next?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sunil Khatri" <sunil.khatri@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 18:47:30 -0000
Message-ID: <174396525007.41104.5863169768046968578@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
In-Reply-To: <20250328082416.1469810-1-sunil.khatri@amd.com>
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

--===============6030157795039704956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,01/19] drm-uapi/amdgpu: sync with drm-next
URL   : https://patchwork.freedesktop.org/series/146929/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8291_FULL -> XEIGTPW_12872_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12872_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12872_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12872_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-lnl:          [PASS][1] -> ([INCOMPLETE][2], [PASS][3]) +1 other test ( 1 incomplete, 1 pass )
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-8/igt@kms_panel_fitting@atomic-fastset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_panel_fitting@atomic-fastset.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][4] -> ([INCOMPLETE][5], [PASS][6])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@xe_pm@s4-vm-bind-prefetch.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12872_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#4665])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#3767]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][10] -> ([PASS][11], [FAIL][12]) ([Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][14], [SKIP][15]) ([Intel XE#2327]) +1 other test ( 2 skip )
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][17] ([Intel XE#4543]) +2 other tests dmesg-fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][18], [SKIP][19]) ([Intel XE#1124]) +6 other tests ( 2 skip )
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#607])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> ([SKIP][21], [SKIP][22]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][25], [SKIP][26]) ([Intel XE#1124])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1124]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [PASS][28] -> ([SKIP][29], [PASS][30]) ([Intel XE#2191])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][31] -> ([SKIP][32], [PASS][33]) ([Intel XE#2314] / [Intel XE#2894])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][34] -> ([SKIP][35], [SKIP][36]) ([Intel XE#2314] / [Intel XE#2894])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#2191])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2314] / [Intel XE#2894])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#367])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][40], [SKIP][41]) ([Intel XE#367])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#367])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#1512])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#787]) +20 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#787]) +155 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][48], [SKIP][49]) ([Intel XE#2887]) +18 other tests ( 2 skip )
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#455] / [Intel XE#787]) +34 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2887]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#3442])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][53] -> ([INCOMPLETE][54], [PASS][55]) ([Intel XE#3862])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([PASS][56], [INCOMPLETE][57]) ([Intel XE#3862])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#3432])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][59], [SKIP][60]) ([Intel XE#3432])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][61], [SKIP][62]) ([Intel XE#2652] / [Intel XE#787]) +7 other tests ( 2 skip )
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#787]) +54 other tests ( 2 skip )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][65], [SKIP][66]) ([Intel XE#455] / [Intel XE#787]) +10 other tests ( 2 skip )
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#2887]) +3 other tests ( 2 skip )
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][71] ([Intel XE#3113])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#4417]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#4416]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#306])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> ([SKIP][75], [SKIP][76]) ([Intel XE#2325]) +1 other test ( 2 skip )
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#306])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_chamelium_color@ctm-max.html
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2325])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([Intel XE#2252]) +6 other tests ( 2 skip )
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2252]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][82], [SKIP][83]) ([Intel XE#373])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_chamelium_frames@dp-crc-single.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#373]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> ([SKIP][85], [SKIP][86]) ([Intel XE#373])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#373]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> ([SKIP][88], [SKIP][89]) ([Intel XE#2390])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][90] ([Intel XE#3304])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][91] ([Intel XE#1178]) +2 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][92] ([Intel XE#1188])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> ([SKIP][93], [SKIP][94]) ([Intel XE#2321])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          NOTRUN -> ([SKIP][95], [SKIP][96]) ([Intel XE#2320]) +4 other tests ( 2 skip )
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x85.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][97], [SKIP][98]) ([Intel XE#308])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x512.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> ([SKIP][99], [SKIP][100]) ([Intel XE#1424])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2320])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#308])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2321])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][104] -> [DMESG-WARN][105] ([Intel XE#4173]) +3 other tests dmesg-warn
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> ([PASS][106], [SKIP][107]) ([Intel XE#309])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> ([SKIP][108], [SKIP][109]) ([Intel XE#2286])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][110] -> ([SKIP][111], [PASS][112]) ([Intel XE#2291]) +6 other tests ( 1 pass, 1 skip )
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][113] -> [SKIP][114] ([Intel XE#2291]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#309]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> ([SKIP][116], [SKIP][117]) ([Intel XE#309])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     [PASS][118] -> ([SKIP][119], [PASS][120]) ([Intel XE#309]) +1 other test ( 1 pass, 1 skip )
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#309])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2-set2:     [PASS][122] -> [SKIP][123] ([Intel XE#309])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][124] -> ([PASS][125], [FAIL][126]) ([Intel XE#4667])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#323])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> ([SKIP][128], [SKIP][129]) ([Intel XE#4210])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][130] -> ([SKIP][131], [PASS][132]) ([Intel XE#4302])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][133], [SKIP][134]) ([Intel XE#1340])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#4354])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][136] -> ([PASS][137], [SKIP][138]) ([Intel XE#4354])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> ([SKIP][139], [SKIP][140]) ([Intel XE#4354]) +1 other test ( 2 skip )
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> ([SKIP][141], [SKIP][142]) ([Intel XE#4331])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2244])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#4156])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][145], [SKIP][146]) ([Intel XE#4156])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][147] -> [SKIP][148] ([Intel XE#310])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-busy-flip:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#310])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][150] -> ([FAIL][151], [FAIL][152]) ([Intel XE#301])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][153] -> [FAIL][154] ([Intel XE#3321])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][155] -> ([FAIL][156], [PASS][157]) ([Intel XE#301]) +3 other tests ( 1 fail, 1 pass )
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][158] -> ([PASS][159], [FAIL][160]) ([Intel XE#3321]) +1 other test ( 1 fail, 1 pass )
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][161] -> ([FAIL][162], [FAIL][163]) ([Intel XE#3321])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-dg2-set2:     [PASS][164] -> ([PASS][165], [SKIP][166]) ([Intel XE#310]) +3 other tests ( 1 pass, 1 skip )
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][167] -> ([PASS][168], [SKIP][169]) ([Intel XE#2316]) +8 other tests ( 1 pass, 1 skip )
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][170] -> [SKIP][171] ([Intel XE#2316])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#310])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-bmg:          [PASS][173] -> [INCOMPLETE][174] ([Intel XE#2049])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([PASS][175], [INCOMPLETE][176]) ([Intel XE#2049]) +1 other test ( 1 incomplete, 1 pass )
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a6.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][177] -> ([PASS][178], [FAIL][179]) ([Intel XE#301]) +3 other tests ( 1 fail, 1 pass )
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][180] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][181] ([Intel XE#301]) +8 other tests fail
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][182] -> ([PASS][183], [INCOMPLETE][184]) ([Intel XE#2049] / [Intel XE#2597])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
    - shard-bmg:          [PASS][185] -> ([INCOMPLETE][186], [PASS][187]) ([Intel XE#2049] / [Intel XE#2597])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@d-dp2:
    - shard-dg2-set2:     NOTRUN -> ([PASS][188], [INCOMPLETE][189]) ([Intel XE#2049] / [Intel XE#2597])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp2.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp2.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([PASS][190], [INCOMPLETE][191]) ([Intel XE#2049] / [Intel XE#2597])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [PASS][192] -> ([PASS][193], [FAIL][194]) ([Intel XE#2882]) +1 other test ( 1 fail, 1 pass )
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_flip@plain-flip-ts-check.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_flip@plain-flip-ts-check.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][195] -> ([FAIL][196], [PASS][197]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-adlp:         NOTRUN -> [SKIP][198] ([Intel XE#455]) +9 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#455]) +6 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][200], [SKIP][201]) ([Intel XE#2293] / [Intel XE#2380]) +3 other tests ( 2 skip )
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][202], [SKIP][203]) ([Intel XE#2293]) +3 other tests ( 2 skip )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#2293] / [Intel XE#2380])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#2293])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#1401]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][208] -> [DMESG-FAIL][209] ([Intel XE#4543])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][210] -> [FAIL][211] ([Intel XE#1874])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][212] ([Intel XE#656]) +16 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][213], [SKIP][214]) ([Intel XE#2311] / [Intel XE#2312]) +3 other tests ( 2 skip )
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#651]) +7 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][216] ([Intel XE#2311]) +10 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][217], [SKIP][218]) ([Intel XE#651]) +6 other tests ( 2 skip )
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][219] -> ([SKIP][220], [PASS][221]) ([Intel XE#656]) +5 other tests ( 1 pass, 1 skip )
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][222], [SKIP][223]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][224], [SKIP][225]) ([Intel XE#4141]) +4 other tests ( 2 skip )
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#4141]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][227] ([Intel XE#651]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][228], [SKIP][229]) ([Intel XE#2311]) +16 other tests ( 2 skip )
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][230], [SKIP][231]) ([Intel XE#656]) +1 other test ( 2 skip )
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][232], [SKIP][233]) ([Intel XE#651]) +1 other test ( 2 skip )
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][234], [SKIP][235]) ([Intel XE#2313]) +17 other tests ( 2 skip )
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][236], [SKIP][237]) ([Intel XE#2312] / [Intel XE#2313]) +3 other tests ( 2 skip )
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#2312]) +7 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#656]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#2313]) +10 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][241], [SKIP][242]) ([Intel XE#653]) +4 other tests ( 2 skip )
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][243] ([Intel XE#653]) +5 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][244] ([Intel XE#653]) +12 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][245], [SKIP][246]) ([Intel XE#2502])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][247] ([Intel XE#1339])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.html
    - shard-bmg:          NOTRUN -> ([SKIP][248], [SKIP][249]) ([Intel XE#2340])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#1503])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][251] ([Intel XE#2927])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][252] ([Intel XE#2927])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][253] ([Intel XE#2925])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][254] -> ([PASS][255], [FAIL][256]) ([Intel XE#616]) +1 other test ( 1 fail, 1 pass )
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> ([SKIP][257], [SKIP][258]) ([Intel XE#2393])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][259] -> ([PASS][260], [SKIP][261]) ([Intel XE#4596]) +1 other test ( 1 pass, 1 skip )
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-adlp:         NOTRUN -> [SKIP][262] ([Intel XE#4596]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-bmg:          NOTRUN -> ([SKIP][263], [SKIP][264]) ([Intel XE#2493] / [Intel XE#4596])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> ([SKIP][265], [SKIP][266]) ([Intel XE#2493])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][267] ([Intel XE#2763]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> ([SKIP][268], [SKIP][269]) ([Intel XE#2763]) +9 other tests ( 2 skip )
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> ([SKIP][270], [SKIP][271]) ([Intel XE#870])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][272] ([Intel XE#2938])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][273] ([Intel XE#2938])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][274] ([Intel XE#870]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][275] -> ([FAIL][276], [PASS][277]) ([Intel XE#718])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> ([SKIP][278], [SKIP][279]) ([Intel XE#2392])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html
    - shard-adlp:         NOTRUN -> [SKIP][280] ([Intel XE#1129])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][281] ([Intel XE#908])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][282] -> [SKIP][283] ([Intel XE#836])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][284], [SKIP][285]) ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test ( 2 skip )
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][286] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][287], [SKIP][288]) ([Intel XE#1489]) +1 other test ( 2 skip )
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][289] ([Intel XE#1489]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][290] ([Intel XE#1489]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
    - shard-bmg:          NOTRUN -> ([SKIP][291], [SKIP][292]) ([Intel XE#1489]) +4 other tests ( 2 skip )
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][293] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][294], [SKIP][295]) ([Intel XE#2234] / [Intel XE#2850]) +14 other tests ( 2 skip )
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_psr@fbc-psr-sprite-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][296] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][297] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][298], [SKIP][299]) ([Intel XE#2850] / [Intel XE#929]) +3 other tests ( 2 skip )
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_psr@psr2-cursor-render.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][300] ([Intel XE#3414])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-bmg:          NOTRUN -> [SKIP][301] ([Intel XE#3414] / [Intel XE#3904])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][302], [SKIP][303]) ([Intel XE#3414])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][304] ([Intel XE#3414])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> ([SKIP][305], [SKIP][306]) ([Intel XE#3414] / [Intel XE#3904]) +2 other tests ( 2 skip )
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][307] -> ([PASS][308], [FAIL][309]) ([Intel XE#2883]) +6 other tests ( 1 fail, 1 pass )
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_setmode@basic.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_setmode@basic.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_setmode@basic.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][310] ([Intel XE#2883]) +1 other test fail
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     [PASS][311] -> ([SKIP][312], [PASS][313]) ([Intel XE#455])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2-set2:     [PASS][314] -> ([SKIP][315], [SKIP][316]) ([Intel XE#455])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
    - shard-dg2-set2:     [PASS][317] -> ([ABORT][318], [PASS][319]) ([Intel XE#4540]) +1 other test ( 1 abort, 1 pass )
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:
    - shard-dg2-set2:     [PASS][320] -> ([PASS][321], [DMESG-WARN][322]) ([Intel XE#4212])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][323] -> ([FAIL][324], [FAIL][325]) ([Intel XE#771] / [Intel XE#899]) +1 other test ( 2 fail )
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][326] -> [FAIL][327] ([Intel XE#4459]) +1 other test fail
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][328], [SKIP][329]) ([Intel XE#455])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_vrr@flip-dpms.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][330], [SKIP][331]) ([Intel XE#1499])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_vrr@flip-suspend.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][332] ([Intel XE#1499])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][333], [SKIP][334]) ([Intel XE#756])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html
    - shard-adlp:         NOTRUN -> [SKIP][335] ([Intel XE#756])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [PASS][336] -> ([FAIL][337], [FAIL][338]) ([Intel XE#4278]) +1 other test ( 2 fail )
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][339] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][340] ([Intel XE#1062])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_create@create-big-vram.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][341], [SKIP][342]) ([Intel XE#4497])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_eu_stall@blocking-read.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> ([SKIP][343], [SKIP][344]) ([Intel XE#2905]) +7 other tests ( 2 skip )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][345] ([Intel XE#2905] / [Intel XE#3889])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-bmg:          NOTRUN -> ([SKIP][346], [SKIP][347]) ([Intel XE#2905] / [Intel XE#3889]) +1 other test ( 2 skip )
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-bmg:          NOTRUN -> [SKIP][348] ([Intel XE#2905]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][349] ([Intel XE#2905]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-dg2-set2:     NOTRUN -> [SKIP][350] ([Intel XE#4577])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-adlp:         NOTRUN -> [SKIP][351] ([Intel XE#2905]) +3 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         NOTRUN -> [SKIP][352] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][353] ([Intel XE#2322]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][354] -> [SKIP][355] ([Intel XE#1392]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-adlp:         NOTRUN -> [SKIP][356] ([Intel XE#1392]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> ([SKIP][357], [SKIP][358]) ([Intel XE#2322]) +8 other tests ( 2 skip )
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][359] -> ([SKIP][360], [PASS][361]) ([Intel XE#1392]) +2 other tests ( 1 pass, 1 skip )
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][362], [SKIP][363]) ([Intel XE#288]) +3 other tests ( 2 skip )
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][364] ([Intel XE#288]) +8 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][365] ([Intel XE#288]) +10 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][366] ([Intel XE#1999]) +2 other tests fail
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@buffer-size@rcs-0-256k:
    - shard-lnl:          NOTRUN -> [FAIL][367] ([Intel XE#4541])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-5/igt@xe_oa@buffer-size@rcs-0-256k.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][368] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][369], [SKIP][370]) ([Intel XE#2541] / [Intel XE#3573])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         NOTRUN -> [SKIP][371] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_oa@rc6-disable.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][372] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> ([SKIP][373], [SKIP][374]) ([Intel XE#1061])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-6/igt@xe_peer2peer@read.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][375] ([Intel XE#1173]) +1 other test fail
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][376], [FAIL][377]) ([Intel XE#1173])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][378] ([Intel XE#2284] / [Intel XE#366])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-bmg:          NOTRUN -> [FAIL][379] ([Intel XE#3290])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][380] ([Intel XE#1948])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][381], [SKIP][382]) ([Intel XE#2284] / [Intel XE#366])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][383] -> [ABORT][384] ([Intel XE#1794])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-6/igt@xe_pm@s4-basic.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][385] -> [ABORT][386] ([Intel XE#1794])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][387] -> ([ABORT][388], [PASS][389]) ([Intel XE#1794])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][390] ([Intel XE#944])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][391] ([Intel XE#944])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][392] ([Intel XE#944])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> ([SKIP][393], [SKIP][394]) ([Intel XE#944]) +1 other test ( 2 skip )
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html
    - shard-adlp:         NOTRUN -> [SKIP][395] ([Intel XE#944])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> ([SKIP][396], [SKIP][397]) ([Intel XE#4130]) +1 other test ( 2 skip )
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          NOTRUN -> ([SKIP][398], [SKIP][399]) ([Intel XE#4273])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [DMESG-WARN][400] ([Intel XE#4173]) -> [PASS][401] +11 other tests pass
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@core_hotunplug@hotreplug.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-6/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][402] ([Intel XE#4543]) -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-2/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][404] ([Intel XE#3908]) -> [PASS][405] +1 other test pass
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#2191]) -> ([PASS][407], [PASS][408])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][409] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][411] ([Intel XE#3124]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][413] ([Intel XE#2291]) -> ([PASS][414], [PASS][415])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#309]) -> ([PASS][417], [PASS][418]) +1 other test ( 2 pass )
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][419] ([Intel XE#2291]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2-set2:     [INCOMPLETE][421] ([Intel XE#3226]) -> ([PASS][422], [PASS][423])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#4354]) -> ([PASS][425], [PASS][426])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-sst.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#310]) -> [PASS][428] +1 other test pass
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][429] ([Intel XE#3321]) -> [PASS][430] +1 other test pass
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][431] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][433] ([Intel XE#301]) -> [PASS][434] +2 other tests pass
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][435] ([Intel XE#2316]) -> ([PASS][436], [PASS][437])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][438] ([Intel XE#2316]) -> [PASS][439] +1 other test pass
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][440] ([Intel XE#886]) -> ([PASS][441], [PASS][442])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a2-dp2:
    - shard-dg2-set2:     [FAIL][443] ([Intel XE#886]) -> [PASS][444]
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a2-dp2.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a2-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][445] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][446]
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][447] ([Intel XE#2049] / [Intel XE#2597]) -> ([PASS][448], [PASS][449])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][450] ([Intel XE#4543]) -> [PASS][451] +1 other test pass
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][452] ([Intel XE#1874]) -> [PASS][453]
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#656]) -> [PASS][455]
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#656]) -> ([PASS][457], [PASS][458]) +2 other tests ( 2 pass )
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#836]) -> ([PASS][460], [PASS][461])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#1392]) -> ([PASS][463], [PASS][464]) +2 other tests ( 2 pass )
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#1392]) -> [PASS][466] +1 other test pass
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][467] ([Intel XE#1794]) -> [PASS][468] +1 other test pass
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][469] ([Intel XE#1794]) -> ([PASS][470], [PASS][471])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@xe_pm@s4-exec-after.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-6/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][472] ([Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][473] ([Intel XE#4543])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][474] ([Intel XE#4173] / [Intel XE#4543]) -> [DMESG-FAIL][475] ([Intel XE#4543])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#787]) -> ([SKIP][477], [SKIP][478]) ([Intel XE#455] / [Intel XE#787]) +2 other tests ( 2 skip )
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#787]) -> [SKIP][480] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][482] ([Intel XE#787]) +4 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][484], [SKIP][485]) ([Intel XE#787]) +1 other test ( 2 skip )
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][486] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][487] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][488] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][489], [INCOMPLETE][490]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][491] ([Intel XE#1727] / [Intel XE#3113]) -> ([PASS][492], [INCOMPLETE][493]) ([Intel XE#1727] / [Intel XE#3113]) +1 other test ( 1 incomplete, 1 pass )
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][494] ([Intel XE#1178]) -> ([FAIL][495], [SKIP][496]) ([Intel XE#1178] / [Intel XE#455])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_content_protection@legacy.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_content_protection@legacy.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][497] ([Intel XE#1188]) -> ([FAIL][498], [SKIP][499]) ([Intel XE#1188] / [Intel XE#455])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_content_protection@uevent.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_content_protection@uevent.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#309]) -> ([SKIP][501], [PASS][502]) ([Intel XE#309])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#4302]) -> ([PASS][504], [SKIP][505]) ([Intel XE#4302])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][506] ([Intel XE#3321]) -> ([FAIL][507], [PASS][508]) ([Intel XE#3321]) +1 other test ( 1 fail, 1 pass )
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][509] ([Intel XE#2049] / [Intel XE#2597]) -> ([INCOMPLETE][510], [PASS][511]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][512] ([Intel XE#886]) -> ([FAIL][513], [PASS][514]) ([Intel XE#886]) +2 other tests ( 1 fail, 1 pass )
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][515] ([Intel XE#4543]) -> [DMESG-FAIL][516] ([Intel XE#324] / [Intel XE#4543]) +3 other tests dmesg-fail
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#656]) -> [SKIP][518] ([Intel XE#651]) +3 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][519] ([Intel XE#2312]) -> ([SKIP][520], [SKIP][521]) ([Intel XE#2311]) +4 other tests ( 2 skip )
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-rte:
    - shard-bmg:          [SKIP][522] ([Intel XE#2311]) -> ([SKIP][523], [SKIP][524]) ([Intel XE#2312])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-rte.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-rte.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][525] ([Intel XE#2311]) -> [SKIP][526] ([Intel XE#2312]) +3 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#651]) -> ([SKIP][528], [SKIP][529]) ([Intel XE#651] / [Intel XE#656]) +9 other tests ( 2 skip )
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][530] ([Intel XE#4141]) -> ([SKIP][531], [SKIP][532]) ([Intel XE#2312] / [Intel XE#4141]) +4 other tests ( 2 skip )
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][533] ([Intel XE#2312]) -> ([SKIP][534], [SKIP][535]) ([Intel XE#2312] / [Intel XE#4141])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][536] ([Intel XE#2312]) -> ([SKIP][537], [SKIP][538]) ([Intel XE#4141]) +2 other tests ( 2 skip )
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][539] ([Intel XE#4141]) -> [SKIP][540] ([Intel XE#2312])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][541] ([Intel XE#2312]) -> [SKIP][542] ([Intel XE#4141])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][543] ([Intel XE#2050]) -> [SKIP][544] ([Intel XE#4141])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#656]) -> ([SKIP][546], [SKIP][547]) ([Intel XE#651] / [Intel XE#656]) +1 other test ( 2 skip )
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][548] ([Intel XE#2311]) -> ([SKIP][549], [SKIP][550]) ([Intel XE#2311] / [Intel XE#2312]) +14 other tests ( 2 skip )
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#651]) -> [SKIP][552] ([Intel XE#656])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#656]) -> ([SKIP][554], [SKIP][555]) ([Intel XE#651]) +4 other tests ( 2 skip )
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][556] ([Intel XE#2313]) -> [SKIP][557] ([Intel XE#2312]) +3 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][558] ([Intel XE#653]) -> [SKIP][559] ([Intel XE#656])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#653]) -> ([SKIP][561], [SKIP][562]) ([Intel XE#653] / [Intel XE#656]) +5 other tests ( 2 skip )
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#656]) -> ([SKIP][564], [SKIP][565]) ([Intel XE#653]) +2 other tests ( 2 skip )
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][566] ([Intel XE#2312]) -> ([SKIP][567], [SKIP][568]) ([Intel XE#2313]) +3 other tests ( 2 skip )
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][569] ([Intel XE#2313]) -> ([SKIP][570], [SKIP][571]) ([Intel XE#2312] / [Intel XE#2313]) +10 other tests ( 2 skip )
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][572] ([Intel XE#2313]) -> ([SKIP][573], [SKIP][574]) ([Intel XE#2312]) +2 other tests ( 2 skip )
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#656]) -> [SKIP][576] ([Intel XE#653]) +2 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][577] ([Intel XE#2312]) -> [SKIP][578] ([Intel XE#2313]) +2 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][579] ([Intel XE#653]) -> ([SKIP][580], [SKIP][581]) ([Intel XE#656]) +1 other test ( 2 skip )
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][582] ([Intel XE#656]) -> ([SKIP][583], [SKIP][584]) ([Intel XE#653] / [Intel XE#656]) +2 other tests ( 2 skip )
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#455]) -> ([SKIP][586], [SKIP][587]) ([Intel XE#455] / [Intel XE#4596])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-y.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-y.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#4596]) -> [SKIP][589] ([Intel XE#455])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][590] ([Intel XE#4540]) -> ([ABORT][591], [ABORT][592]) ([Intel XE#2705] / [Intel XE#4540])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][593] ([Intel XE#4540]) -> ([ABORT][594], [ABORT][595]) ([Intel XE#4502] / [Intel XE#4540])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          [FAIL][596] ([Intel XE#3924]) -> ([FAIL][597], [FAIL][598]) ([Intel XE#3924] / [Intel XE#4568]) +1 other test ( 2 fail )
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-render.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][599] ([Intel XE#2426]) -> ([SKIP][600], [SKIP][601]) ([Intel XE#2426] / [Intel XE#2509])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][602] ([Intel XE#771]) -> ([FAIL][603], [FAIL][604]) ([Intel XE#771] / [Intel XE#899]) +1 other test ( 2 fail )
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#1392]) -> ([PASS][606], [SKIP][607]) ([Intel XE#1392]) +3 other tests ( 1 pass, 1 skip )
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [FAIL][608] ([Intel XE#4541]) -> ([PASS][609], [FAIL][610]) ([Intel XE#4541])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-1/igt@xe_oa@buffer-size.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-7/igt@xe_oa@buffer-size.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-5/igt@xe_oa@buffer-size.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#1061]) -> ([FAIL][612], [FAIL][613]) ([Intel XE#1173])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_peer2peer@write.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@xe_peer2peer@write.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@xe_peer2peer@write.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
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
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3290]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3290
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568
  [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8291 -> IGTPW_12872
  * Linux: xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874 -> xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7

  IGTPW_12872: 12872
  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874: 274d97eed4e8376b7a66b8904066baed6a1ae874
  xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7: c66e1b5495eda37a602bf54a9f4f34d476d2f3d7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/index.html

--===============6030157795039704956==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,01/19] drm-uapi/amd=
gpu: sync with drm-next</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146929/">https://patchwork.freedesktop.org/series/146929/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12872/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12872/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8291_FULL -&gt; XEIGTPW_12872_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12872_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12872_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
872_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-8/igt@kms_panel_fitting@atomic-fastset.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/sha=
rd-lnl-8/igt@kms_panel_fitting@atomic-fastset.html">INCOMPLETE</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-3/igt@k=
ms_panel_fitting@atomic-fastset.html">PASS</a>) +1 other test ( 1 incomplet=
e, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg=
2-436/igt@xe_pm@s4-vm-bind-prefetch.html">INCOMPLETE</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@xe_pm@s4-=
vm-bind-prefetch.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12872_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/i=
gt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-=
4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12872/shard-lnl-5/igt@kms_async_flips@async-flip=
-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-1/igt@kms_async_=
flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel =
XE#911</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-=
270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12872/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate=
-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate=
-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12872/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12872/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stri=
de-64bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12872/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/112=
4">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-1920=
x1080p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12872/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displ=
ays-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-dis=
plays-1920x1080p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12872/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-=
2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12872/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-=
2560x1440p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12872/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-=
3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12872/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-=
3840x2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays=
-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12872/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_bw@linear-tiling-4-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays=
-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12872/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-3840x2160=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tile=
d-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tile=
d-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-til=
ed-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +155 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-til=
ed-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12872/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
7">Intel XE#2887</a>) +18 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12872/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-c=
cs.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12872/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc=
-ccs.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_ccs@crc-prima=
ry-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#386=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_ccs@crc-sprite-p=
lanes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs@pipe-c-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_ccs@missing-ccs-bu=
ffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +54 other t=
ests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_ccs@missing-ccs-bu=
ffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12872/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-m=
c-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522"=
>Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12872/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe=
-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_chamelium_color@ctm-blue-t=
o-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_chamelium_color@ctm-green-t=
o-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12872/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325"=
>Intel XE#2325</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_chamelium_color@ctm-max.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-ch=
ange-during-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-ch=
ange-during-hibernate.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_chamelium_frames@dp-crc-s=
ingle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12872/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-single.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">=
Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-storm-=
disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-after=
-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12872/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-with=
-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_content_protection@dp-mst-l=
ic-type-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12872/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_content_protection@srm@pip=
e-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_content_protection@uevent@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen=
-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12872/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_cursor_crc@cursor-random-25=
6x85.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12872/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">I=
ntel XE#2320</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_cursor_crc@cursor-random-=
512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12872/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
08">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-mov=
ement-128x42.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12872/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-128=
x42.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-mov=
ement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12872/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4173">Intel XE#4173</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-atomic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12872/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-a=
tomic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_cursor_legacy@basic=
-busy-flip-before-cursor-varying-size.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_cursor_leg=
acy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>) +6 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2872/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12872/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-v=
arying-size.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12872/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-at=
omic-transitions.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb=
-atomic-transitions.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test ( 1 pass, 1 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-f=
lipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-siz=
e.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12872/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
872/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg=
-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667">Intel XE#4667</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2872/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
2/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/i=
gt@kms_display_modes@extended-mode-basic.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c@pipe-a-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pi=
pe-a-hdmi-a-3.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/sh=
ard-bmg-7/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_d=
p_link_training@non-uhbr-sst.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2872/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-f=
allback.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12872/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Inte=
l XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872=
/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2872/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Int=
el XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_flip@2x-busy-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">=
Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872=
/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/i=
gt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12872/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdm=
i-a6-dp4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12872/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi=
-a6-dp4.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/301">Intel XE#301</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12872/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdm=
i-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12872/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321">Intel XE#3321</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a=
3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12872/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdm=
i-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12872/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a=
3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-d=
g2-432/igt@kms_flip@2x-nonexisting-fb.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_flip@2x-n=
onexisting-fb.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests ( 1 pass, 1 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12872/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-of=
f-vs-modeset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12872/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-o=
ff-vs-modeset.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2316">Intel XE#2316</a>) +8 other tests ( 1 pass, 1 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/s=
hard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE=
#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-=
vblank@d-hdmi-a6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_flip@flip-vs-blocking-wf-vblan=
k@d-hdmi-a6.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test ( 1 incomplet=
e, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12872/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12872/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-edp1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +3 other tests ( 1 fail, 1 pass )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblan=
k@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblan=
k@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2=
-432/igt@kms_flip@flip-vs-suspend.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_flip@flip-vs-=
suspend.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12872/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-=
a3.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12872/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdm=
i-a3.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp=
2.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12872/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp2.html">INCOMPLETE</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">I=
ntel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_flip@flip-vs-suspend@d-hdmi=
-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12872/shard-bmg-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">INCOMPLE=
TE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/204=
9">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-b=
mg-3/igt@kms_flip@plain-flip-ts-check.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_flip@plain-=
flip-ts-check.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test ( 1 fail, 1 pass =
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12872/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/sha=
rd-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#=
886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-=
yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp=
-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-64bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_flip_scaled_crc@=
flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel =
XE#2380</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@k=
ms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2293">Intel XE#2293</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#140=
1</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-=
a-1-y-to-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12872/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@p=
ipe-b-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-=
a-1-x-to-y.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12872/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@p=
ipe-c-hdmi-a-1-x-to-y.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Inte=
l XE#2312</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rg=
b101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-rgb101010-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-onoff.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-cur-indfb-onoff.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests ( 1=
 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel =
XE#4141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +=
4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) +16 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 =
other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb101010-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE=
#2313</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_=
tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)=
 +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-s=
lowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
2/shard-bmg-6/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1339">Intel XE#1339</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
72/shard-bmg-4/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_joiner@basic-ultra-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_joiner@invalid-modeset-for=
ce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-=
64.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12872/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-s=
ize-64.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12872/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-siz=
e-64.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/616">Intel XE#616</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872=
/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard=
-bmg-2/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_plane_m=
ultiple@2x-tiling-x.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) +1 other test ( 1 pass, 1=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_plane_multiple@2x-tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4596">Intel XE#4596</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12872/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#=
2493</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
872/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_plane_scaling@planes-upscal=
e-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_plane_scaling=
@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_pm_backlight@bad-brightness=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12872/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#8=
70</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_pm_backlight@brightness-wit=
h-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_pm_backlight@brightness-wi=
th-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-1/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12872/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-b=
mg-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Int=
el XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">I=
ntel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872=
/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#83=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/s=
hard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#31=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836=
">Intel XE#836</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-d=
mg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1489">Intel XE#1489</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-=
move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-mov=
e-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_psr@fbc-psr-cursor-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_psr@fbc-psr-sprite-blt.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
2/shard-bmg-4/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel=
 XE#2850</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_psr@psr2-cursor-plane-move.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_psr@psr2-cursor-render.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
872/shard-dg2-433/igt@kms_psr@psr2-cursor-render.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">=
Intel XE#929</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-form=
at.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3414">Intel XE#3414</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-270.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_rotation_crc@sprite-rotatio=
n-90-pos-100-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90-po=
s-100-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_setmode@basic.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@k=
ms_setmode@basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_setmode@basic.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel X=
E#2883</a>) +6 other tests ( 1 fail, 1 pass )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_setmode@basic.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">In=
tel XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/s=
hard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt=
@kms_setmode@clone-exclusive-crtc.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
872/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2=
-464/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing=
@pipe-a-hdmi-a-6-dp-4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_setmode@invalid-clo=
ne-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">ABORT</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_s=
etmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">PASS</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">I=
ntel XE#4540</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing=
@pipe-b-hdmi-a-6-dp-4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_setmode@invalid-clo=
ne-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">DMESG-W=
ARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
12">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12872/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12872/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/771">Intel XE#771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/899">Intel XE#899</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-3=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_vrr@flip-dpms.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard=
-dg2-433/igt@kms_vrr@flip-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_vrr@flip-suspend.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shar=
d-bmg-6/igt@kms_vrr@flip-suspend.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_writeback@writeback-pixel=
-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12872/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/756">Intel XE#756</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_writeback@writeback-pixel-f=
ormats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
872/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg=
-6/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>=
) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@xe_compute_preempt@compute-thr=
eadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_create@create-big-vram.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_eu_stall@blocking-read.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
72/shard-dg2-466/igt@xe_eu_stall@blocking-read.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12872/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#=
2905</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufenc=
e-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence=
-sigint-client.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12872/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint=
-client.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test ( 2 skip =
)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-vm-dest=
roy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_eudebug_online@resume-dss.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@xe_eudebug_online@set-breakpoi=
nt-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_eudebug_online@writes-cachin=
g-vram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_evict@evict-beng-small.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
61">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#232=
2</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12872/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bin=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bas=
ic-defer-bind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12872/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer=
-bind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2322">Intel XE#2322</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-invalidate-race.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@xe_exec_basic@multigpu-on=
ce-bindexecqueue-userptr-invalidate-race.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_exec_ba=
sic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE=
#1392</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_exec_fault_mode@many-execq=
ueues-userptr-invalidate-race-prefetch.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@xe_exec_faul=
t_mode@many-execqueues-userptr-invalidate-race-prefetch.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr=
-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind=
-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_=
mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@rcs-0-256k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-lnl-5/igt@xe_oa@buffer-size@rcs-0-256k.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-a=
ccess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@xe_oa@non-privileged-access-v=
addr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12872/shard-dg2-464/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">I=
ntel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_oa@rc6-disable.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Int=
el XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@xe_oa@syncs-syncobj-cfg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-lnl-6/igt@xe_peer2peer@read.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-l=
nl-8/igt@xe_peer2peer@read.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vr=
am01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@xe_peer2peer@write@write-gpua=
-vram01-gpub-system-p2p.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@xe_pm@d3cold-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3290=
">Intel XE#3290</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948"=
>Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12872/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel X=
E#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-6/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-9/igt@xe_p=
m@s4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-2=
/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-ln=
l-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-4/igt@xe_pm@s4-vm-bind=
-unbind-all.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@xe_query@multigpu-query-invali=
d-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-lnl-8/igt@xe_query@multigpu-query-invalid-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@xe_query@multigpu-query-mem-usa=
ge.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12872/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel =
XE#944</a>) +1 other test ( 2 skip )</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@xe_query@multigpu-query-mem-usa=
ge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@xe_sriov_auto_provisioning@excl=
usive-ranges.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12872/shard-bmg-4/igt@xe_sriov_auto_provisioning@exclusive-ran=
ges.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4130">Intel XE#4130</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2872/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273=
</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12872/shard-adlp-6/igt@core_hotunplug@hotreplug.html">PASS</a> +11 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-=
c-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-2/igt@kms_async_flips@=
invalid-async-flip-atomic@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transit=
ion@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-9/igt@kms_atomic_tr=
ansition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 oth=
er test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840=
x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_bw@connected-linear-=
tiling-2-displays-3840x2160p.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_bw@connected-linea=
r-tiling-2-displays-3840x2160p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-b-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_ccs@rando=
m-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs=
-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_cursor_legacy@=
2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_curs=
or_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12872/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-le=
gacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12872/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html=
">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_cursor_lega=
cy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3226">Intel XE#3226</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-=
flipb-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12872/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-leg=
acy.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">In=
tel XE#4354</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12872/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-sst.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/sha=
rd-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/310">Intel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_flip@2x-absolute-wf_vblank-inte=
rruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@km=
s_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_flip@2x-flip=
-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +2 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12872/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard=
-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#23=
16</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
872/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/886">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12872/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interr=
uptible.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible@=
ab-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_flip@2x-plain-f=
lip-ts-check-interruptible@ab-hdmi-a2-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_flip@flip=
-vs-suspend-interruptible@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/204=
9">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2597">Intel XE#2597</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b=
-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12872/shard-bmg-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">PAS=
S</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-=
a-1-y-to-y.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-2/igt@kms_flip_tiling@=
flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-=
a-1-y-to-x.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-2/igt@kms_flip_tiling@flip-c=
hange-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_trac=
king@fbc-2p-primscrn-spr-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a>) +2 other tests ( 2=
 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress-n=
o-wait.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12872/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalid=
ate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@xe_exec_basic@multigpu=
-no-exec-userptr-invalidate-race.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@xe_exec_basic@mult=
igpu-no-exec-userptr-invalidate-race.html">PASS</a>) +2 other tests ( 2 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12872/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic=
-defer-mmap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/s=
hard-adlp-1/igt@xe_pm@s4-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/s=
hard-lnl-8/igt@xe_pm@s4-exec-after.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-6/igt@xe_pm@s4-exec-afte=
r.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-event=
s.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4173">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-6/igt@kms_async_f=
lips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG=
-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
173">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp=
-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs=
@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_ccs@ccs-on-a=
nother-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_=
ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/787">Intel XE#787</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs=
@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_ccs@crc-prima=
ry-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc=
-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt=
@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_c=
cs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-43=
6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7">Intel XE#787</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"=
>Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@kms_ccs=
@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_ccs@ran=
dom-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_content_protection@legacy.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel =
XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12872/shard-dg2-466/igt@kms_content_protection@legacy.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-4=
64/igt@kms_content_protection@legacy.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_content_protection@uevent.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel =
XE#1188</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12872/shard-dg2-432/igt@kms_content_protection@uevent.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-4=
64/igt@kms_content_protection@uevent.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa=
-varying-size.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302=
">Intel XE#4302</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12872/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2872/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Int=
el XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vbl=
ank@ab-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank=
@ab-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test ( 1 fail, 1 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2597">Intel XE#2597</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-3/igt@kms_flip@flip-vs-suspe=
nd-interruptible.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12872/shard-bmg-2/igt@kms_flip@flip-vs-suspend-inter=
ruptible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test ( 1 inco=
mplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">=
Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12872/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872=
/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#=
886</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-x=
tile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-adlp-1/igt@kms_flip_s=
caled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel =
XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-rte.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">I=
ntel XE#2311</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-rte.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/s=
hard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-rte.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontb=
uffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141=
">Intel XE#4141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tracking@=
fbc-2p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracki=
ng@fbc-2p-primscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2050">Intel XE#2050</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_frontbuffer_tracking@fb=
c-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-i=
ndfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
6">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-433/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/651">Intel XE#651</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-mul=
tidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cu=
r-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_=
frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/653">Intel XE#653</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
2">Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2313">Intel XE#2313</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_frontbuffer_t=
racking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12872/shard-bmg-7/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontb=
uffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@kms_frontbuffer_trackin=
g@psr-2p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12872/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-4=
64/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12872/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540=
">Intel XE#4540</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12872/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.ht=
ml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2872/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html">ABORT</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Int=
el XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hd=
mi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4540">Intel XE#4540</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-435/igt@kms_plane_scaling@intel=
-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-464/igt@kms_plane_scaling@in=
tel-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4502">Intel XE#4502</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924">Intel =
XE#3924</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12872/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-render.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-2=
/igt@kms_psr@fbc-psr2-primary-render.html">FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3924">Intel XE#3924</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Intel XE#4568=
</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12872/shard-bmg-1/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12872/shard-bmg-8/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Inte=
l XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12872/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-l=
nl-1/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#=
899</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebi=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12872/shard-dg2-463/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-rebind.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12872/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bi=
ndexecqueue-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests ( 1 pass, 1=
 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-1/igt@xe_oa@buffer-size.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shar=
d-lnl-7/igt@xe_oa@buffer-size.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12872/shard-lnl-5/igt@xe_oa@buffer-size.html"=
>FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/s=
hard-dg2-464/igt@xe_peer2peer@write.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12872/shard-dg2-436/igt@xe_peer2peer@wr=
ite.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8291 -&gt; IGTPW_12872</li>
<li>Linux: xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874 -&gt; xe-2868-c=
66e1b5495eda37a602bf54a9f4f34d476d2f3d7</li>
</ul>
<p>IGTPW_12872: 12872<br />
  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874: 274d97eed4e8376b7a66b89=
04066baed6a1ae874<br />
  xe-2868-c66e1b5495eda37a602bf54a9f4f34d476d2f3d7: c66e1b5495eda37a602bf54=
a9f4f34d476d2f3d7</p>

</body>
</html>

--===============6030157795039704956==--
