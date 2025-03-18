Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF1CC282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 11:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84824892D2;
	Tue, 18 Mar 2025 11:13:32 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EED5892D2;
 Tue, 18 Mar 2025 11:13:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8139205159544416933=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Close_sysfs_and_debugfs_te?=
 =?utf-8?q?st_gap_between_i915_and_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 18 Mar 2025 11:13:31 -0000
Message-ID: <174229641111.48082.4211209057816650529@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250318095350.57133-1-peter.senna@linux.intel.com>
In-Reply-To: <20250318095350.57133-1-peter.senna@linux.intel.com>
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

--===============8139205159544416933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Close sysfs and debugfs test gap between i915 and Xe
URL   : https://patchwork.freedesktop.org/series/146433/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8276_full -> XEIGTPW_12790_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12790_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12790_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12790_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-max.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_properties@connector-properties-atomic:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@kms_properties@connector-properties-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@kms_properties@connector-properties-atomic.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-lnl:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  
New tests
---------

  New tests have been introduced between XEIGT_8276_full and XEIGTPW_12790_full:

### New IGT tests (4) ###

  * igt@xe_debugfs@debugfs_read_all_entries:
    - Statuses : 3 pass(s)
    - Exec time: [0.14, 0.70] s

  * igt@xe_debugfs@sysfs_read_all_entries:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@xe_oa@syncs-syncobj-wait@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@syncs-ufence-wait-cfg@ccs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12790_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-lnl:          NOTRUN -> [ABORT][8] ([Intel XE#3914])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#623])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2233])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#3718] / [Intel XE#827])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2550] / [Intel XE#3767]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#873])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#873])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_async_flips@invalid-async-flip.html
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#873])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#3768])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#664])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2370])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#3658])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#316]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1407]) +8 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2327]) +7 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2328])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#607])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1477])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#607])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1124]) +22 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1124]) +13 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1124]) +12 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#610])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1428])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#610])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#2191])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2314] / [Intel XE#2894])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2314] / [Intel XE#2894]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2191])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#2191]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1512]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#367]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#367])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#367]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2652] / [Intel XE#787]) +26 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2887]) +23 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#3432])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#3432]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#2907]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2669]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#787]) +160 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#455] / [Intel XE#787]) +40 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][53] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2887]) +37 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][55] ([Intel XE#3124])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][56] ([Intel XE#1727] / [Intel XE#3113])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#4416]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_cdclk@plane-scaling.html
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2724])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#306]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2325]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#306]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2252]) +18 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#373]) +10 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#373]) +10 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#307])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2390])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2341]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x256:
    - shard-bmg:          [PASS][68] -> [INCOMPLETE][69] ([Intel XE#4148])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-256x256.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x256.html

  * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][70] ([Intel XE#4148])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2320]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#308]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#2321]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2321]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1424]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2291])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#309]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#2291]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][80] ([Intel XE#877])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][81] -> [DMESG-WARN][82] ([Intel XE#877])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2286]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1508])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4210])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#4302])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#4302])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4302])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1340])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([i915#3804])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#4354])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#4331])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#2244]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2244]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#4422])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#4422])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#4422])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4156])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#776])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#703])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_feature_discovery@display-3x.html
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2373])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#703])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#310])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          NOTRUN -> [FAIL][105] ([Intel XE#3321]) +4 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][106] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][107] ([Intel XE#301]) +2 other tests fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][108] -> [FAIL][109] ([Intel XE#301]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][110] -> [SKIP][111] ([Intel XE#2316]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1421]) +9 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2316]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][114] ([Intel XE#301]) +1 other test fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          NOTRUN -> [FAIL][115] ([Intel XE#2882]) +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#886]) +5 other tests fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2293] / [Intel XE#2380]) +7 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2293]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1401]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1397] / [Intel XE#1745])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1397])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#352])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#651]) +42 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#651]) +16 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#4141]) +28 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#656])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#658])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1469])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2352])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2311]) +46 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2312]) +21 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2313]) +52 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#4439])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#656]) +47 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#653]) +33 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#2340])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2340])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#1503])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1503])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#2927])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2927]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#2927])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2934])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#4090])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2501])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2486])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#4359])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#4329])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][151] ([Intel XE#324]) +2 other tests dmesg-fail
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][152] ([Intel XE#324]) +3 other tests dmesg-warn
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [PASS][153] -> [DMESG-WARN][154] ([Intel XE#4091])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][155] -> [DMESG-WARN][156] ([Intel XE#4113])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@kms_plane_lowres@tiling-4@pipe-b-dp-4.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@kms_plane_lowres@tiling-4@pipe-b-dp-4.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#599]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#455]) +17 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#2493])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_plane_multiple@tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2493])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2763]) +14 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#2763]) +17 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#2763]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2938])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#2938])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#870])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#736])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2391])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#1131])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#3309])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-2/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#3309])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2392])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#1439] / [Intel XE#3141])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#1489]) +13 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#2893]) +4 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#1489]) +11 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#1128]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#1122]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2387]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#2234] / [Intel XE#2850]) +37 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#1406]) +6 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#2850] / [Intel XE#929]) +18 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#2414])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#2939])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#3414]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic:
    - shard-dg2-set2:     [PASS][190] -> [FAIL][191] ([Intel XE#2883])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@kms_setmode@basic.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][192] -> [FAIL][193] ([Intel XE#2883]) +2 other tests fail
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-2-pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][194] ([Intel XE#2883]) +5 other tests fail
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_setmode@basic@pipe-b-hdmi-a-2-pipe-a-dp-2.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#1435])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][196] ([Intel XE#1729])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][197] ([Intel XE#1499]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#1499])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-2/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#756])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#756]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#1091] / [Intel XE#2849])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-lnl:          NOTRUN -> [SKIP][202] ([Intel XE#1091] / [Intel XE#2849])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#1091] / [Intel XE#2849])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#1126]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#2504])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@non-blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#4497])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@xe_eu_stall@non-blocking-read.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#2905]) +12 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][209] ([Intel XE#2905] / [Intel XE#3889])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#2905]) +21 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#2905] / [Intel XE#3889]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#2905] / [Intel XE#3889]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][213] ([Intel XE#2905]) +10 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#688]) +9 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-8/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#1392]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][216] -> [SKIP][217] ([Intel XE#1392]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#1392]) +8 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][219] ([Intel XE#2322]) +18 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][220] ([Intel XE#288]) +30 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][221] ([Intel XE#2360])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#560])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@xe_media_fill@media-fill.html
    - shard-bmg:          NOTRUN -> [SKIP][223] ([Intel XE#2459] / [Intel XE#2596])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][224] ([Intel XE#512])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@xe_mmap@small-bar.html
    - shard-bmg:          NOTRUN -> [SKIP][225] ([Intel XE#586])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@xe_mmap@small-bar.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#512])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][227] ([Intel XE#378])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@xe_module_load@force-load.html
    - shard-lnl:          NOTRUN -> [SKIP][228] ([Intel XE#378])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@xe_module_load@force-load.html
    - shard-bmg:          NOTRUN -> [SKIP][229] ([Intel XE#2457])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@xe_module_load@force-load.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][230] ([Intel XE#379])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#4501])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@xe_oa@buffer-size.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][232] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][233] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#2838] / [Intel XE#979])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html
    - shard-bmg:          NOTRUN -> [SKIP][235] ([Intel XE#1420])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][236] ([Intel XE#977])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][237] ([Intel XE#2245])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#2236])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     NOTRUN -> [FAIL][239] ([Intel XE#1173]) +1 other test fail
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#2427])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@xe_peer2peer@write.html
    - shard-lnl:          NOTRUN -> [SKIP][241] ([Intel XE#1061])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#2284]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][243] ([Intel XE#2284])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-6/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][244] ([Intel XE#1948])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][245] ([Intel XE#584]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     NOTRUN -> [ABORT][246] ([Intel XE#4268]) +1 other test abort
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          NOTRUN -> [ABORT][247] ([Intel XE#4268])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][248] ([Intel XE#944]) +6 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][249] ([Intel XE#944]) +7 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#944]) +8 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][251] ([Intel XE#4130]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][252] ([Intel XE#4130]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][253] ([Intel XE#4130]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-bmg:          NOTRUN -> [SKIP][254] ([Intel XE#4351])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][255] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][257] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4522]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#309]) -> [PASS][260] +4 other tests pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
    - shard-bmg:          [SKIP][261] ([Intel XE#2291]) -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][263] ([Intel XE#301]) -> [PASS][264] +2 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#310]) -> [PASS][266] +4 other tests pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [SKIP][267] ([Intel XE#2316]) -> [PASS][268] +3 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][269] ([Intel XE#301]) -> [PASS][270] +1 other test pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][271] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][272] +1 other test pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#656]) -> [PASS][274] +5 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#4328]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][277] ([Intel XE#1435]) -> [PASS][278] +1 other test pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][279] ([Intel XE#4459]) -> [PASS][280] +1 other test pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@testdisplay:
    - shard-dg2-set2:     [ABORT][281] ([Intel XE#4540]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@testdisplay.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@testdisplay.html

  
#### Warnings ####

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][284] ([Intel XE#787]) +6 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][285] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][286] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#787]) -> [SKIP][288] ([Intel XE#455] / [Intel XE#787])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#4440]) -> [SKIP][290] ([Intel XE#4418])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          [ABORT][291] ([Intel XE#4528]) -> [SKIP][292] ([Intel XE#1397] / [Intel XE#1745])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          [ABORT][293] ([Intel XE#4528]) -> [SKIP][294] ([Intel XE#1397])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][295] ([Intel XE#2312]) -> [SKIP][296] ([Intel XE#2311]) +12 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#651]) -> [SKIP][298] ([Intel XE#656]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][299] ([Intel XE#2311]) -> [SKIP][300] ([Intel XE#2312]) +2 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][301] ([Intel XE#4141]) -> [SKIP][302] ([Intel XE#2312]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][303] ([Intel XE#2312]) -> [SKIP][304] ([Intel XE#4141]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#656]) -> [SKIP][306] ([Intel XE#651]) +13 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#656]) -> [SKIP][308] ([Intel XE#653]) +11 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][309] ([Intel XE#2313]) -> [SKIP][310] ([Intel XE#2312]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][311] ([Intel XE#2312]) -> [SKIP][312] ([Intel XE#2313]) +11 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][313] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][314] ([Intel XE#3544])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
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
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
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
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
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
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4091
  [Intel XE#4113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4113
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4148]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4148
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
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
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8276 -> IGTPW_12790

  IGTPW_12790: 12790
  IGT_8276: 8276
  xe-2825-a958e31a81b3267201c85b6f171419586afa792c: a958e31a81b3267201c85b6f171419586afa792c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/index.html

--===============8139205159544416933==
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
<tr><td><b>Series:</b></td><td>Close sysfs and debugfs test gap between i91=
5 and Xe</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146433/">https://patchwork.freedesktop.org/series/146433/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12790/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12790/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8276_full -&gt; XEIGTPW_12790_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12790_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12790_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
790_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-max.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12790/shard-dg2-434/igt@kms_plane_alpha_blend@constant-alpha-max.html">INCO=
MPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-434/igt@kms_properties@connector-properties-atomic.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12790/shard-dg2-434/igt@kms_properties@connector-properties-atomic.html">=
FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint=
-sigint-debugger.html">SKIP</a></li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@xe_eudebug_online@set-breakpoi=
nt-sigint-debugger.html">SKIP</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-2/igt@xe_eudebug_online@set-breakpoint=
-sigint-debugger.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8276_full and XEIGTPW_12790=
_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@xe_debugfs@debugfs_read_all_entries:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.14, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@sysfs_read_all_entries:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg@ccs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12790_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@core_hotunplug@hotreplug-lateclo=
se.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tile=
d-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/623">Intel XE#623</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_async_flips@alternate-sync-a=
sync-flip-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3701">Intel XE#3701</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_async_flips@alternate-sync-a=
sync-flip-atomic@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-cc=
s:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-d-dp-4-4-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_async_flips@invalid-async-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/873">Intel XE#873</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_async_flips@test-cursor.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
8">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-=
offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stri=
de-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +13 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1428">Intel XE#1428</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-o=
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
el-xe/IGTPW_12790/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12790/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_bw@connected-linear-tiling=
-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_bw@linear-tiling-4-display=
s-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180=
-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +40 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">In=
tel XE#3124</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416=
">Intel XE#4416</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724=
">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to=
-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_chamelium_frames@hdmi-cmp-pl=
anar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2252">Intel XE#2252</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-wit=
h-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-with-=
enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_content_protection@dp-mst-=
lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-256x256.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_127=
90/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x256.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4148">=
Intel XE#4148</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-=
256x256@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4148">Intel XE#4148</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-=
256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_cursor_crc@cursor-offscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-f=
lip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12790/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-toggle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12790/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@kms_display_modes@extended-mod=
e-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4302">Intel XE#4302</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4302">Intel XE#4302</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6b=
pc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
56">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
6">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/703">Intel XE#703</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2373">Intel XE#2373</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_feature_discovery@display-=
3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interru=
ptible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12790/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) =
+1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12790/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi=
-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-b=
mg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_flip@2x-plain-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421"=
>Intel XE#1421</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recrea=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-=
interruptible@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_flip@plain-flip-ts-check.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/s=
hard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</=
a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4=
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
/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_force_connector_basic@force-=
connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-=
2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +42 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-sh=
rfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-=
offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +28 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-til=
ing-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1469">Intel XE#1469</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-til=
ing-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +46 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +21 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +52 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-f=
bc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4439">Intel XE#4439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +47 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/653">Intel XE#653</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2340">Intel XE#2340</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_getfb@getfb2-accept-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/248=
6">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@kms_pipe_stress@stress-xrgb888=
8-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4359">Intel XE#4359</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_plane@plane-position-covered=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_plane@plane-position-covered=
@pipe-b-plane-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2=
-434/igt@kms_plane_lowres@tiling-4.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4091">Intel XE#4091</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-435/igt@kms_plane_lowres@tiling-4@pipe-b-dp-4.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_127=
90/shard-dg2-434/igt@kms_plane_lowres@tiling-4@pipe-b-dp-4.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4113">=
Intel XE#4113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_plane_lowres@tiling-4@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/599">Intel XE#599</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_plane_multiple@tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>) +17 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2493">Intel XE#2493</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_plane_scaling@plane-downsc=
ale-factor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@kms_plane_scaling@plane-downsc=
ale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@kms_pm_backlight@brightness-wi=
th-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_pm_backlight@fade.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"=
>Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/736">Intel XE#736</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-2/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3309">Intel XE#3309</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
9">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-n=
o-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_psr2_sf@pr-cursor-plane-upda=
te-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2893">Intel XE#2893</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1128">Intel XE#1128</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2387">Intel XE#2387</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_psr@pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@kms_psr@psr-sprite-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@kms_psr_stress_test@invalidate=
-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_rotation_crc@primary-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-8/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-434/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt=
@kms_setmode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2883">Intel XE#2883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-=
lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-2-pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_setmode@basic@pipe-b-hdmi-=
a-2-pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2883">Intel XE#2883</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@kms_tiled_display@basic-test-p=
attern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_vrr@flip-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-2/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"=
>Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@sriov_basic@enable-vfs-autopro=
be-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@xe_compute_preempt@compute-pre=
empt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@xe_create@multigpu-create-massiv=
e-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@xe_eu_stall@non-blocking-read.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@xe_eudebug@attach-debug-metadata=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@xe_eudebug@basic-vm-access-par=
ameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@xe_eudebug@basic-vm-access-userp=
tr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2905">Intel XE#2905</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-=
sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@xe_eudebug_online@basic-breakp=
oint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-8/igt@xe_evict@evict-beng-large-extern=
al-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12790/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mma=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basi=
c-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null=
-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-463/igt@xe_exec_fault_mode@once-userpt=
r-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-=
batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/560=
">Intel XE#560</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/245=
9">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel=
 XE#512</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel=
 XE#586</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@xe_mmap@small-bar.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Int=
el XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@xe_module_load@force-load.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
378">Intel XE#378</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
8">Intel XE#378</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
57">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@xe_noexec_ping_pong.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Int=
el XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@xe_oa@buffer-size.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">In=
tel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@xe_oa@polling-small-buf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@xe_oa@syncs-syncobj-wait-cfg.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
8">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/979">Intel XE#979</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">I=
ntel XE#977</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">=
Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236"=
>Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-436/igt@xe_peer2peer@read.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">In=
tel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-8/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-3/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Int=
el XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@xe_pm@d3cold-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-6/igt@xe_pm@d3cold-mocs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Inte=
l XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">=
Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-4/igt@xe_pm@s3-mocs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#=
584</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@xe_pm@s4-basic.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Inte=
l XE#4268</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@xe_pm@s4-multiple-execs.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/426=
8">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@xe_query@multigpu-query-config=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-7/igt@xe_query@multigpu-query-invalid-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-466/igt@xe_sriov_auto_provisioning@sel=
fconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfc=
onfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfc=
onfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-e=
ngine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_bw@connecte=
d-linear-tiling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE=
#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12790/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-=
dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-v=
s-cursor-legacy.html">PASS</a> +4 other tests pass</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12790/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12790/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank@cd-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">I=
ntel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12790/shard-dg2-434/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PA=
SS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1279=
0/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb.html">PASS</a> +3 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12790/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12790/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank=
@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-432/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">PASS</a> +5 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">In=
tel XE#4328</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12790/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html">PASS=
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
ee/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_setmode@invalid-clone-single-cr=
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
90/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-434/igt@testdisplay.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg=
2-466/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-d-hdm=
i-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_ccs@bad-rota=
tion-90-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel =
XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12790/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pip=
e-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@kms_ccs@random-ccs-da=
ta-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440=
">Intel XE#4440</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12790/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xt=
ile-downscaling.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4528">Intel XE#4528</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-5/igt@kms_flip_scaled_c=
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
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-5/i=
gt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-d=
efault-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multi=
draw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12790/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shr=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-1/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) =
+13 other tests skip</li>
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
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-435/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multid=
raw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2=
p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-7/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3=
374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
44">Intel XE#3544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12790/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8276 -&gt; IGTPW_12790</li>
</ul>
<p>IGTPW_12790: 12790<br />
  IGT_8276: 8276<br />
  xe-2825-a958e31a81b3267201c85b6f171419586afa792c: a958e31a81b3267201c85b6=
f171419586afa792c</p>

</body>
</html>

--===============8139205159544416933==--
