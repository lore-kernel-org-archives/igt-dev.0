Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74819C35FFC
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 07:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F9410E13C;
	Wed, 19 Mar 2025 07:19:16 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BA110E13C;
 Wed, 19 Mar 2025 07:19:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5893024011576881105=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_support_for_Xe_in_runt?=
 =?utf-8?q?ime-pm_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Mar 2025 07:19:14 -0000
Message-ID: <174236875459.52647.10058794123497877301@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250317082823.1631744-1-soham.purkait@intel.com>
In-Reply-To: <20250317082823.1631744-1-soham.purkait@intel.com>
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

--===============5893024011576881105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for Xe in runtime-pm (rev2)
URL   : https://patchwork.freedesktop.org/series/146379/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8276_full -> XEIGTPW_12796_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12796_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12796_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12796_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-lnl:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  
New tests
---------

  New tests have been introduced between XEIGT_8276_full and XEIGTPW_12796_full:

### New IGT tests (1) ###

  * igt@xe_oa@syncs-syncobj-wait@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12796_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-lnl:          NOTRUN -> [ABORT][6] ([Intel XE#3914])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#623])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2233])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#911]) +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#873])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#873])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@kms_async_flips@invalid-async-flip.html
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#873])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#3768])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2370])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#3658])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#316]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1407]) +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2327]) +7 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#607])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#607])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +19 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124]) +13 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +12 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#610])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1428])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#610])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#2191])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#2191]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1512]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#367]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#367])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#367]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#787]) +152 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2652] / [Intel XE#787]) +30 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#3432])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#3432]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2907]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#2669]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2887]) +30 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2887]) +21 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#455] / [Intel XE#787]) +43 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][46] ([Intel XE#2705] / [Intel XE#4522]) +1 other test incomplete
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#4416]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_cdclk@plane-scaling.html
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2724])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2325]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#306]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#306]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2252]) +14 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#373]) +10 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#373]) +10 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#307])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#307])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-8/igt@kms_content_protection@dp-mst-type-1.html
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2390])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2341]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2320]) +8 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#308]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1424]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2321]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2321]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#2291])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#309]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][67] ([Intel XE#877])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][68] -> [SKIP][69] ([Intel XE#309]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2286]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1508])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#1508])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4210])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4302])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#4354])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#4354])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#4354]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2244]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2244]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#4422])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#4422])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#4422])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#703])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#703])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2316]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [PASS][86] -> [SKIP][87] ([Intel XE#310]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][88] ([Intel XE#301] / [Intel XE#3321])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][89] ([Intel XE#301]) +6 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][90] ([Intel XE#3321]) +7 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [PASS][91] -> [SKIP][92] ([Intel XE#2316]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1421]) +9 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][94] ([Intel XE#301]) +3 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][95] -> [FAIL][96] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [PASS][97] -> [FAIL][98] ([Intel XE#301])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-lnl:          [PASS][99] -> [DMESG-WARN][100] ([Intel XE#2932]) +1 other test dmesg-warn
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][101] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          NOTRUN -> [FAIL][102] ([Intel XE#2882]) +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#886]) +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][105] ([Intel XE#886]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1397] / [Intel XE#1745])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1397])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2293] / [Intel XE#2380]) +9 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2293]) +9 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1401]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1401] / [Intel XE#1745]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#352])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2311]) +54 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#651]) +33 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#651]) +11 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#4141]) +24 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [PASS][117] -> [SKIP][118] ([Intel XE#656]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#656]) +46 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#656]) +8 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2312]) +18 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2313]) +50 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#653]) +28 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2340])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_getfb@getfb2-accept-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2340])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#455]) +23 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1503])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][128] -> [SKIP][129] ([Intel XE#3012])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#2927])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2927]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2927])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#4090])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2501])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2486])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#4329])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#4359])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#4329])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][139] ([Intel XE#324]) +2 other tests dmesg-fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][140] ([Intel XE#324]) +16 other tests dmesg-warn
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [PASS][141] -> [FAIL][142] ([Intel XE#616])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@kms_plane_cursor@overlay.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][143] ([Intel XE#616]) +4 other tests fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-dg2-set2:     [PASS][144] -> [DMESG-WARN][145] ([Intel XE#4091] / [Intel XE#4113])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_plane_lowres@tiling-none.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][146] -> [DMESG-WARN][147] ([Intel XE#4113])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#599])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@kms_plane_lowres@tiling-yf.html
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2393])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#2493]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2493]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2763]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#2763]) +9 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2938])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#2938])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#870])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#736])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#1131])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2392])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#1439] / [Intel XE#836])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1439] / [Intel XE#3141])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#2893]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#1489]) +17 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#1489]) +9 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#1128]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#1122]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2387]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#1406]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#2850] / [Intel XE#929]) +17 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2234] / [Intel XE#2850]) +32 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2234])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2414])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#2939])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#3414]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#1127]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#1127]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#2330]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2413]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#1435])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#2426])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#362])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#1499])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@kms_vrr@negative-basic.html
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#1499]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#756])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#756])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#1091] / [Intel XE#2849])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#1091] / [Intel XE#2849])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#1091] / [Intel XE#2849])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#1126])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#4497])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#2905]) +14 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#2905] / [Intel XE#3889])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#2905]) +21 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#2905] / [Intel XE#3889]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2905] / [Intel XE#3889])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#2905]) +11 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#688]) +6 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [PASS][201] -> [SKIP][202] ([Intel XE#1392]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#1392]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#2322]) +16 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#288]) +36 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#2360])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#560])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@xe_media_fill@media-fill.html
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#2459] / [Intel XE#2596])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#512])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@xe_mmap@small-bar.html
    - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#586])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@xe_mmap@small-bar.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#512])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][212] ([Intel XE#378])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_module_load@force-load.html
    - shard-bmg:          NOTRUN -> [SKIP][213] ([Intel XE#2457])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@xe_module_load@force-load.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][214] ([Intel XE#4501])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_oa@buffer-size.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2248])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#2838] / [Intel XE#979])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][219] ([Intel XE#1420] / [Intel XE#2838])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html
    - shard-bmg:          NOTRUN -> [SKIP][220] ([Intel XE#1420])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][221] ([Intel XE#2236])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][222] ([Intel XE#1061])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][223] ([Intel XE#2427])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@xe_peer2peer@write.html
    - shard-lnl:          NOTRUN -> [SKIP][224] ([Intel XE#1061])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][225] ([Intel XE#2284])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@xe_pm@d3cold-mocs.html
    - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#2284]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#1948])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][228] ([Intel XE#584]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     NOTRUN -> [ABORT][229] ([Intel XE#4268]) +1 other test abort
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          NOTRUN -> [ABORT][230] ([Intel XE#4268])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#944]) +4 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][232] ([Intel XE#944]) +7 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#944]) +6 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#4130]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][235] ([Intel XE#4130]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][236] ([Intel XE#4130]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-bmg:          NOTRUN -> [SKIP][237] ([Intel XE#4351])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][238] -> [ABORT][239] ([Intel XE#3084])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][240] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2191]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#309]) -> [PASS][245] +1 other test pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [SKIP][246] ([Intel XE#2291]) -> [PASS][247] +5 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][248] ([Intel XE#2373]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][250] ([Intel XE#301]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          [SKIP][252] ([Intel XE#2316]) -> [PASS][253] +3 other tests pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#310]) -> [PASS][255] +5 other tests pass
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#656]) -> [PASS][257] +5 other tests pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#4328]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][260] ([Intel XE#1435]) -> [PASS][261] +1 other test pass
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][262] ([Intel XE#4459]) -> [PASS][263] +1 other test pass
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [SKIP][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283]) ([Intel XE#2457]) -> ([PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [SKIP][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330]) ([Intel XE#378]) -> ([PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-466/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-466/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-466/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-466/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][357] ([Intel XE#787]) +6 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#787]) -> [SKIP][359] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][360] ([Intel XE#1178]) -> [SKIP][361] ([Intel XE#455])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][362] ([Intel XE#4132]) -> [FAIL][363] ([Intel XE#1178]) +1 other test fail
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#309]) -> [INCOMPLETE][365] ([Intel XE#3226])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [INCOMPLETE][366] ([Intel XE#2049]) -> [SKIP][367] ([Intel XE#2316])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          [ABORT][368] ([Intel XE#4528]) -> [SKIP][369] ([Intel XE#1397] / [Intel XE#1745])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          [ABORT][370] ([Intel XE#4528]) -> [SKIP][371] ([Intel XE#1397])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][372] ([Intel XE#2311]) -> [SKIP][373] ([Intel XE#2312]) +4 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][374] ([Intel XE#2312]) -> [SKIP][375] ([Intel XE#2311]) +13 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][376] ([Intel XE#2312]) -> [SKIP][377] ([Intel XE#4141]) +8 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][378] ([Intel XE#4141]) -> [SKIP][379] ([Intel XE#2312]) +3 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          [SKIP][380] ([Intel XE#4141]) -> [INCOMPLETE][381] ([Intel XE#2050])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#656]) -> [SKIP][383] ([Intel XE#651]) +11 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#651]) -> [SKIP][385] ([Intel XE#656]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#656]) -> [SKIP][387] ([Intel XE#653]) +10 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#653]) -> [SKIP][389] ([Intel XE#656]) +4 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][390] ([Intel XE#2313]) -> [SKIP][391] ([Intel XE#2312]) +5 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][392] ([Intel XE#2312]) -> [SKIP][393] ([Intel XE#2313]) +10 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#362]) -> [SKIP][395] ([Intel XE#1500])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@testdisplay:
    - shard-dg2-set2:     [ABORT][396] ([Intel XE#4540]) -> [ABORT][397] ([Intel XE#2705] / [Intel XE#4540])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@testdisplay.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@testdisplay.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
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
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
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
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4091
  [Intel XE#4113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4113
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4528]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4528
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8276 -> IGTPW_12796

  IGTPW_12796: 12796
  IGT_8276: 8276
  xe-2825-a958e31a81b3267201c85b6f171419586afa792c: a958e31a81b3267201c85b6f171419586afa792c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/index.html

--===============5893024011576881105==
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
<tr><td><b>Series:</b></td><td>Add support for Xe in runtime-pm (rev2)</td>=
</tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146379/">https://patchwork.freedesktop.org/series/146379/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12796/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12796/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8276_full -&gt; XEIGTPW_12796_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12796_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12796_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
796_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-463/igt@kms_dp_linktrain_fallback@dp-fallback.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_127=
96/shard-dg2-435/igt@kms_dp_linktrain_fallback@dp-fallback.html">FAIL</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint=
-sigint-debugger.html">SKIP</a></li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@xe_eudebug_online@set-breakpoi=
nt-sigint-debugger.html">SKIP</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@xe_eudebug_online@set-breakpoint=
-sigint-debugger.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8276_full and XEIGTPW_12796=
_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_oa@syncs-syncobj-wait@ccs-0:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12796_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@core_hotunplug@hotreplug-lateclo=
se.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tile=
d-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/623">Intel XE#623</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-cc=
s-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE=
#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@kms_async_flips@invalid-async-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/873">Intel XE#873</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-=
offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stri=
de-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +13 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1428">Intel XE#1428</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2560=
x1440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12796/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-466/igt@kms_bw@connected-linear-tiling=
-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_bw@linear-tiling-4-display=
s-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-ti=
led-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +152 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +30 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-=
y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-=
y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +21 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +43 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416=
">Intel XE#4416</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724=
">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to=
-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-chang=
e-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-wit=
h-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-with-=
enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_content_protection@dp-mst-=
lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-8/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/307">Intel XE#307</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-=
256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_cursor_crc@cursor-offscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_cursor_crc@cursor-random-max=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12796/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">=
Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-toggle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12796/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"=
>Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-=
mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4354">Intel XE#4354</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4354">Intel XE#4354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2244">Intel XE#2244</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-8/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/703">Intel XE#703</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@kms_feature_discovery@display-=
3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2796/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Int=
el XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12796/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316=
">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_flip@2x-plain-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421"=
>Intel XE#1421</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-=
interruptible@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_127=
96/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel X=
E#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12796/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-6/=
igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) +1 other te=
st dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_flip@flip-vs-suspend-inter=
ruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test inc=
omplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2796/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Int=
el XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-ed=
p1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-x=
tile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-x=
tile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@kms_force_connector_basic@force-=
connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +54 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-=
2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +33 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-sh=
rfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +24 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-i=
ndfb-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-prim=
scrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +46 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +18 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +50 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +28 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_getfb@getfb2-accept-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2340">Intel XE#2340</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/sha=
rd-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/248=
6">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4329">Intel XE#4329</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb888=
8-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4359">Intel XE#4359</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@kms_plane@plane-position-covered=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_plane@plane-position-hole-dp=
ms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +16 other tests dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-434/igt@kms_plane_cursor@overlay.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-=
432/igt@kms_plane_cursor@overlay.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-436/igt@kms_plane_lowres@tiling-none.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-=
dg2-435/igt@kms_plane_lowres@tiling-none.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4091">Intel XE#4091</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4113">Inte=
l XE#4113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-436/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12796/shard-dg2-435/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4113">Intel XE#4113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
99">Intel XE#599</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2493">Intel XE#2493</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2493">Intel XE#2493</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_pm_backlight@brightness-wi=
th-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_pm_backlight@fade.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"=
>Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
9">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-n=
o-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@kms_psr2_sf@pr-cursor-plane-upda=
te-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2893">Intel XE#2893</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1128">Intel XE#1128</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2387">Intel XE#2387</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_psr@pr-sprite-plane-move.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_psr_stress_test@invalidate=
-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_rotation_crc@primary-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_tiled_display@basic-test-p=
attern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"=
>Intel XE#1499</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"=
>Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_writeback@writeback-check-=
output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_writeback@writeback-check-ou=
tput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@sriov_basic@enable-vfs-autopro=
be-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@xe_eu_stall@unprivileged-acces=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@xe_eudebug@basic-connect.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@xe_eudebug@basic-vm-access-par=
ameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_eudebug@basic-vm-access-userp=
tr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2905">Intel XE#2905</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +2 other tests skip</l=
i>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_eudebug_online@basic-breakp=
oint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@xe_evict@evict-beng-large-extern=
al-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-rebind.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12796/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basi=
c-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null=
-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_exec_fault_mode@once-userpt=
r-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-=
batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/560=
">Intel XE#560</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/245=
9">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel=
 XE#512</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel=
 XE#586</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@xe_mmap@small-bar.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Int=
el XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_module_load@force-load.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
378">Intel XE#378</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
57">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_oa@buffer-size.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">In=
tel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248=
">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@xe_oa@polling-small-buf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@xe_oa@syncs-syncobj-wait-cfg.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
8">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/979">Intel XE#979</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2838">Intel XE#2838</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236"=
>Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">In=
tel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Int=
el XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-4/igt@xe_pm@d3cold-mocs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Inte=
l XE#2284</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_pm@d3cold-mocs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Inte=
l XE#2284</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">=
Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-6/igt@xe_pm@s3-mocs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#=
584</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@xe_pm@s4-basic.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Inte=
l XE#4268</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@xe_pm@s4-multiple-execs.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/426=
8">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@xe_query@multigpu-query-gt-lis=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-8/igt@xe_query@multigpu-query-invalid-=
extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-1/igt@xe_query@multigpu-query-invalid-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@xe_sriov_auto_provisioning@sel=
fconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-lnl-3/igt@xe_sriov_auto_provisioning@selfc=
onfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfc=
onfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_sriov_scheduling@nonpreempt-e=
ngine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-ln=
l-7/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_bw@connecte=
d-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920=
x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_bw@connected-linear-t=
iling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_cursor_legacy@2x-long-flip-v=
s-cursor-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12796/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legac=
y.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12796/shard-bmg-2/igt@kms_feature_discovery@display-2x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">In=
tel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12796/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2=
316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2796/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning.html">PASS</a> +3 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">I=
ntel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12796/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PA=
SS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-cur-indfb-onoff.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">In=
tel XE#4328</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12796/shard-dg2-434/igt@kms_joiner@basic-force-big-joiner.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_setmode@invalid-clone-single-cr=
tc-stealing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#445=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_127=
96/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8276/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bm=
g-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
276/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12796/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12796/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard=
-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
796/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12796/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12796/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12796/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8276/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-=
dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8276/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-43=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_827=
6/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8276/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12796/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-=
434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_127=
96/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-466/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12796/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-432/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12796/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/sh=
ard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12796/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-463/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12796/shard-dg2-436/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-d=
g2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12796/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-466/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12796/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-43=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796=
/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12796/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs=
-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@km=
s_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_ccs@random-ccs-=
data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">I=
ntel XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12796/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4132">Intel XE#4132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_content_protection@srm@pipe-a=
-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-434/igt@kms_cursor_le=
gacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel=
 XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interrup=
tible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_flip@2x-blocking-a=
bsolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xt=
ile-downscaling.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4528">Intel XE#4528</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/igt@kms_flip_scaled_c=
rc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Inte=
l XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xt=
ile-downscaling@pipe-a-default-mode.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4528">Intel XE#4528</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-lnl-5/i=
gt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-d=
efault-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">=
Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12796/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-c=
ur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-436/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
hrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cu=
r-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-435/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg2-464/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-4/igt@kms_frontbuffer_tracking@=
psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12796/shard-bmg-2/igt@kms_frontbuffer_tracking@=
psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/362">Intel XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12796/shard-dg2-433/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-434/igt@testdisplay.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12796/shard-dg=
2-434/igt@testdisplay.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8276 -&gt; IGTPW_12796</li>
</ul>
<p>IGTPW_12796: 12796<br />
  IGT_8276: 8276<br />
  xe-2825-a958e31a81b3267201c85b6f171419586afa792c: a958e31a81b3267201c85b6=
f171419586afa792c</p>

</body>
</html>

--===============5893024011576881105==--
