Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483B6C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 23:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1F510E0CC;
	Sun,  6 Apr 2025 23:48:36 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A7410E099;
 Sun,  6 Apr 2025 23:48:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3213247108850754747=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_PMU_tests_for_GT_frequ?=
 =?utf-8?q?ency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 23:48:35 -0000
Message-ID: <174398331512.41500.2656227628459186063@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402013912.2981094-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250402013912.2981094-1-vinay.belgaumkar@intel.com>
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

--===============3213247108850754747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add PMU tests for GT frequency
URL   : https://patchwork.freedesktop.org/series/147098/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8297_FULL -> XEIGTPW_12902_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12902_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12902_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12902_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][1] -> ([INCOMPLETE][2], [PASS][3]) +1 other test ( 1 incomplete, 1 pass )
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * {igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_enhance0} (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][4] +5 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_enhance0.html

  * {igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_enhance1} (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][5] +7 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_enhance1.html

  
New tests
---------

  New tests have been introduced between XEIGT_8297_FULL and XEIGTPW_12902_FULL:

### New IGT tests (8) ###

  * igt@xe_pmu@gt-frequency:
    - Statuses : 2 fail(s)
    - Exec time: [0.03, 0.04] s

  * igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_compute0:
    - Statuses : 2 fail(s)
    - Exec time: [0.00] s

  * igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_copy0:
    - Statuses : 2 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_render0:
    - Statuses : 2 fail(s)
    - Exec time: [0.01] s

  * igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_decode0:
    - Statuses : 2 fail(s)
    - Exec time: [0.00] s

  * igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_decode1:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  * igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_enhance0:
    - Statuses : 2 fail(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_enhance1:
    - Statuses : 1 fail(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12902_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> ([SKIP][6], [SKIP][7]) ([Intel XE#3157])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][10] ([Intel XE#3718] / [Intel XE#827])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][11] -> ([INCOMPLETE][12], [PASS][13]) ([Intel XE#2613]) +1 other test ( 1 incomplete, 1 pass )
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> ([SKIP][14], [SKIP][15]) ([Intel XE#1407])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][16], [SKIP][17]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [PASS][19] -> ([SKIP][20], [PASS][21]) ([Intel XE#2191])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][22] -> ([PASS][23], [SKIP][24]) ([Intel XE#2314] / [Intel XE#2894])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][25], [SKIP][26]) ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> ([SKIP][27], [SKIP][28]) ([Intel XE#367])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][29], [SKIP][30]) ([Intel XE#2887]) +2 other tests ( 2 skip )
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][31], [SKIP][32]) ([Intel XE#787]) +52 other tests ( 2 skip )
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +36 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#787]) +207 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2887]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][37] ([Intel XE#3124])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#3124])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][40] -> ([DMESG-WARN][41], [PASS][42]) ([Intel XE#1727] / [Intel XE#3113])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#455] / [Intel XE#787]) +10 other tests ( 2 skip )
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#306])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-lnl:          NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#373])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_chamelium_frames@dp-crc-single.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#373]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#373]) +3 other tests ( 2 skip )
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#373]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#1178])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#1178])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#3304])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1188])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#455])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1424])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][58], [SKIP][59]) ([Intel XE#309])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> ([PASS][60], [SKIP][61]) ([Intel XE#309])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2291])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#309])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [PASS][65] -> ([SKIP][66], [SKIP][67]) ([Intel XE#2291])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [PASS][68] -> ([PASS][69], [SKIP][70]) ([Intel XE#309]) +3 other tests ( 1 pass, 1 skip )
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][71] -> ([PASS][72], [SKIP][73]) ([Intel XE#2291]) +5 other tests ( 1 pass, 1 skip )
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-adlp:         [PASS][74] -> [DMESG-WARN][75] ([Intel XE#4173]) +1 other test dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-4/igt@kms_cursor_legacy@torture-move.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-adlp-9/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#4302])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][77] -> ([SKIP][78], [SKIP][79]) ([Intel XE#3009])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_dp_aux_dev.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_dp_aux_dev.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][80], [SKIP][81]) ([Intel XE#4356])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_dp_link_training@uhbr-sst.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][82] -> ([PASS][83], [SKIP][84]) ([Intel XE#2316]) +9 other tests ( 1 pass, 1 skip )
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][85] -> [FAIL][86] ([Intel XE#301])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][87] ([Intel XE#3321]) +4 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][88] ([Intel XE#301]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [PASS][89] -> ([SKIP][90], [SKIP][91]) ([Intel XE#2316])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> ([SKIP][92], [SKIP][93]) ([Intel XE#1421]) +2 other tests ( 2 skip )
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [PASS][94] -> [SKIP][95] ([Intel XE#310])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-dg2-set2:     [PASS][96] -> ([PASS][97], [SKIP][98]) ([Intel XE#310]) +4 other tests ( 1 pass, 1 skip )
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_flip@2x-nonexisting-fb.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#2316])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-bmg:          [PASS][101] -> ([FAIL][102], [PASS][103]) ([Intel XE#2882]) +1 other test ( 1 fail, 1 pass )
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_flip@blocking-wf_vblank.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_flip@blocking-wf_vblank.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][104] -> ([PASS][105], [FAIL][106]) ([Intel XE#886]) +3 other tests ( 1 fail, 1 pass )
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:
    - shard-adlp:         [PASS][107] -> [FAIL][108] ([Intel XE#886])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-adlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [PASS][109] -> ([FAIL][110], [PASS][111]) ([Intel XE#3321]) +3 other tests ( 1 fail, 1 pass )
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#1401]) +1 other test ( 2 skip )
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][114], [SKIP][115]) ([Intel XE#1401] / [Intel XE#1745]) +1 other test ( 2 skip )
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#651]) +6 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][117], [SKIP][118]) ([Intel XE#651]) +2 other tests ( 2 skip )
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#651]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [PASS][120] -> ([SKIP][121], [SKIP][122]) ([Intel XE#656])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#656]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([PASS][124], [SKIP][125]) ([Intel XE#656])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [PASS][126] -> ([PASS][127], [SKIP][128]) ([Intel XE#656]) +7 other tests ( 1 pass, 1 skip )
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][129] -> [SKIP][130] ([Intel XE#656]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#656]) +6 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][132], [SKIP][133]) ([Intel XE#651] / [Intel XE#656])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> ([SKIP][134], [SKIP][135]) ([Intel XE#651])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#653]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][137], [SKIP][138]) ([Intel XE#653])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][139], [SKIP][140]) ([Intel XE#653] / [Intel XE#656])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][141] -> [SKIP][142] ([Intel XE#1503])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][143] -> ([SKIP][144], [PASS][145]) ([Intel XE#1503])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][146], [SKIP][147]) ([Intel XE#2927])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [PASS][148] -> ([PASS][149], [FAIL][150]) ([Intel XE#616])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_plane_cursor@overlay.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_plane_cursor@overlay.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][151] ([Intel XE#616]) +1 other test fail
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][152] ([Intel XE#4212])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][153] ([Intel XE#4540]) +1 other test abort
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          NOTRUN -> ([SKIP][154], [ABORT][155]) ([Intel XE#2763] / [Intel XE#4624]) +1 other test ( 1 abort, 1 skip )
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b:
    - shard-lnl:          NOTRUN -> ([SKIP][156], [SKIP][157]) ([Intel XE#2763]) +1 other test ( 2 skip )
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#870])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][159] -> ([PASS][160], [SKIP][161]) ([Intel XE#836]) +1 other test ( 1 pass, 1 skip )
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_pm_rpm@dpms-non-lpsp.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> ([SKIP][162], [SKIP][163]) ([Intel XE#2893] / [Intel XE#4608])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][164], [SKIP][165]) ([Intel XE#4608]) +1 other test ( 2 skip )
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][166], [SKIP][167]) ([Intel XE#1489])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#2893]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#1122])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          NOTRUN -> ([SKIP][171], [SKIP][172]) ([Intel XE#1406]) +1 other test ( 2 skip )
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][173], [SKIP][174]) ([Intel XE#4609])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html

  * igt@kms_psr@pr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][175], [SKIP][176]) ([Intel XE#2850] / [Intel XE#929])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_psr@pr-sprite-render.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_psr@pr-sprite-render.html
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#1406])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#3414])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     [PASS][179] -> ([PASS][180], [SKIP][181]) ([Intel XE#455])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_setmode@clone-exclusive-crtc.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_setmode@clone-exclusive-crtc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2-set2:     [PASS][182] -> [SKIP][183] ([Intel XE#455])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][184] -> ([SKIP][185], [SKIP][186]) ([Intel XE#1435])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][187] -> ([PASS][188], [FAIL][189]) ([Intel XE#771])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][190] -> ([SKIP][191], [PASS][192]) ([Intel XE#1499])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> ([SKIP][193], [SKIP][194]) ([Intel XE#1499])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-drrs.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][195], [SKIP][196]) ([Intel XE#1123])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#1126])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#2905]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#2905] / [Intel XE#4259])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-8/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][200], [SKIP][201]) ([Intel XE#2905]) +1 other test ( 2 skip )
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_eudebug_online@reset-with-attention.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#2905])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-small:
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#688])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][204] ([Intel XE#1392]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     [PASS][205] -> [SKIP][206] ([Intel XE#1392])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][207] -> ([SKIP][208], [SKIP][209]) ([Intel XE#1392])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][210] -> ([SKIP][211], [PASS][212]) ([Intel XE#1392]) +8 other tests ( 1 pass, 1 skip )
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][213], [SKIP][214]) ([Intel XE#288]) +1 other test ( 2 skip )
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#288]) +6 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][216], [SKIP][217]) ([Intel XE#2229])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#378])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@xe_module_load@force-load.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][219] ([Intel XE#2541] / [Intel XE#3573])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][220], [SKIP][221]) ([Intel XE#2541] / [Intel XE#3573])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@xe_oa@privileged-forked-access-vaddr.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][222] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][223] ([Intel XE#1173])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][224] ([Intel XE#2284] / [Intel XE#366])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][225] -> ([PASS][226], [ABORT][227]) ([Intel XE#1794]) +2 other tests ( 1 abort, 1 pass )
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-8/igt@xe_pm@s4-basic.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@xe_pm@s4-basic.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][228] -> [ABORT][229] ([Intel XE#1794])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-4/igt@xe_pm@s4-basic-exec.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][230] ([Intel XE#944])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][231], [SKIP][232]) ([Intel XE#944])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][233] ([Intel XE#827]) -> ([PASS][234], [PASS][235]) +1 other test ( 2 pass )
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][236] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][238] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#309]) -> [PASS][241] +1 other test pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][242] ([Intel XE#2291]) -> ([PASS][243], [PASS][244]) +1 other test ( 2 pass )
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][245] ([Intel XE#2291]) -> [PASS][246] +1 other test pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#309]) -> ([PASS][248], [PASS][249]) +2 other tests ( 2 pass )
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#455]) -> ([PASS][251], [PASS][252])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#3009]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_dp_aux_dev.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#310]) -> ([PASS][256], [PASS][257]) +5 other tests ( 2 pass )
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][258] ([Intel XE#3321]) -> ([PASS][259], [PASS][260]) +1 other test ( 2 pass )
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][261] ([Intel XE#301]) -> [PASS][262] +2 other tests pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#310]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][265] ([Intel XE#2316]) -> ([PASS][266], [PASS][267]) +2 other tests ( 2 pass )
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:
    - shard-bmg:          [FAIL][268] ([Intel XE#2882]) -> ([PASS][269], [PASS][270]) +1 other test ( 2 pass )
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-adlp:         [FAIL][271] ([Intel XE#886]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-adlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a2:
    - shard-dg2-set2:     [FAIL][273] -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a2.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1:
    - shard-adlp:         [FAIL][275] -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-adlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#656]) -> [PASS][278] +1 other test pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [INCOMPLETE][279] -> ([PASS][280], [PASS][281]) +1 other test ( 2 pass )
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-6/igt@kms_plane_cursor@primary.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_plane_cursor@primary.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-8/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][282] ([Intel XE#616]) -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][284] ([Intel XE#1435]) -> ([PASS][285], [PASS][286])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][287] ([Intel XE#1435]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#455]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [FAIL][291] ([Intel XE#4278]) -> ([PASS][292], [PASS][293]) +1 other test ( 2 pass )
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#1392]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#1392]) -> ([PASS][297], [PASS][298]) +2 other tests ( 2 pass )
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [DMESG-WARN][299] ([Intel XE#4173]) -> [PASS][300] +1 other test pass
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [FAIL][301] ([Intel XE#4541]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-4/igt@xe_oa@buffer-size.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][303] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][305] ([Intel XE#2314] / [Intel XE#2894]) -> ([PASS][306], [SKIP][307]) ([Intel XE#2314] / [Intel XE#2894])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][309] ([Intel XE#787]) +4 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#787]) -> ([SKIP][311], [SKIP][312]) ([Intel XE#455] / [Intel XE#787]) +7 other tests ( 2 skip )
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#787]) -> [SKIP][314] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][316], [SKIP][317]) ([Intel XE#787]) +3 other tests ( 2 skip )
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][318] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> ([INCOMPLETE][319], [PASS][320]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][321] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][322], [INCOMPLETE][323]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][324] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][325], [DMESG-WARN][326]) ([Intel XE#1727] / [Intel XE#3113])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][327] ([Intel XE#2341]) -> [FAIL][328] ([Intel XE#1178])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#455]) -> [FAIL][330] ([Intel XE#1178])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          [FAIL][331] ([Intel XE#1178]) -> [SKIP][332] ([Intel XE#2341])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_content_protection@lic-type-0.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][333] ([Intel XE#1178]) -> ([FAIL][334], [SKIP][335]) ([Intel XE#1178] / [Intel XE#2341])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_content_protection@srm.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_content_protection@srm.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#455]) -> ([SKIP][337], [FAIL][338]) ([Intel XE#1188] / [Intel XE#455])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_content_protection@uevent.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_content_protection@uevent.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#309]) -> ([SKIP][340], [PASS][341]) ([Intel XE#309])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][342] ([Intel XE#2291]) -> ([PASS][343], [SKIP][344]) ([Intel XE#2291])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#455] / [i915#3804]) -> ([SKIP][346], [SKIP][347]) ([i915#3804])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][348] ([Intel XE#4354]) -> ([SKIP][349], [PASS][350]) ([Intel XE#4354])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][351] ([Intel XE#2316]) -> ([PASS][352], [SKIP][353]) ([Intel XE#2316])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#310]) -> ([SKIP][355], [PASS][356]) ([Intel XE#310]) +1 other test ( 1 pass, 1 skip )
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][357] ([Intel XE#2316]) -> [FAIL][358] ([Intel XE#3321])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][359] ([Intel XE#301]) -> ([FAIL][360], [PASS][361]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][362] ([Intel XE#3321]) -> ([FAIL][363], [PASS][364]) ([Intel XE#3321])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][365] ([Intel XE#886]) -> ([PASS][366], [FAIL][367]) ([Intel XE#886]) +2 other tests ( 1 fail, 1 pass )
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#656]) -> ([SKIP][369], [SKIP][370]) ([Intel XE#651] / [Intel XE#656]) +3 other tests ( 2 skip )
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][371] ([Intel XE#2311]) -> ([SKIP][372], [SKIP][373]) ([Intel XE#2312])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][374] ([Intel XE#2311]) -> ([SKIP][375], [SKIP][376]) ([Intel XE#2311] / [Intel XE#2312]) +19 other tests ( 2 skip )
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][377] ([Intel XE#2312]) -> ([SKIP][378], [SKIP][379]) ([Intel XE#2311] / [Intel XE#2312]) +6 other tests ( 2 skip )
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#656]) -> ([SKIP][381], [SKIP][382]) ([Intel XE#651]) +6 other tests ( 2 skip )
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#656]) -> ([PASS][384], [SKIP][385]) ([Intel XE#656]) +2 other tests ( 1 pass, 1 skip )
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][386] ([Intel XE#4141]) -> [SKIP][387] ([Intel XE#2312]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][388] ([Intel XE#2312]) -> [SKIP][389] ([Intel XE#4141])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][390] ([Intel XE#4141]) -> ([SKIP][391], [SKIP][392]) ([Intel XE#2312] / [Intel XE#4141]) +9 other tests ( 2 skip )
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][393] ([Intel XE#4141]) -> ([SKIP][394], [SKIP][395]) ([Intel XE#2312]) +1 other test ( 2 skip )
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][396] ([Intel XE#2312]) -> ([SKIP][397], [SKIP][398]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][399] ([Intel XE#2312]) -> ([SKIP][400], [SKIP][401]) ([Intel XE#4141]) +3 other tests ( 2 skip )
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#651]) -> ([SKIP][403], [SKIP][404]) ([Intel XE#656])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#656]) -> [SKIP][406] ([Intel XE#651]) +2 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#651]) -> [SKIP][408] ([Intel XE#656]) +5 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#651]) -> ([SKIP][410], [SKIP][411]) ([Intel XE#651] / [Intel XE#656]) +17 other tests ( 2 skip )
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][412] ([Intel XE#2311]) -> [SKIP][413] ([Intel XE#2312]) +3 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][414] ([Intel XE#2312]) -> ([SKIP][415], [SKIP][416]) ([Intel XE#2311]) +4 other tests ( 2 skip )
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][417] ([Intel XE#2312]) -> [SKIP][418] ([Intel XE#2311]) +4 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#653]) -> [SKIP][420] ([Intel XE#656]) +2 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][421] ([Intel XE#2313]) -> ([SKIP][422], [SKIP][423]) ([Intel XE#2312] / [Intel XE#2313]) +16 other tests ( 2 skip )
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#656]) -> ([SKIP][425], [SKIP][426]) ([Intel XE#653]) +4 other tests ( 2 skip )
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][427] ([Intel XE#2312]) -> ([SKIP][428], [SKIP][429]) ([Intel XE#2312] / [Intel XE#2313]) +4 other tests ( 2 skip )
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#653]) -> ([SKIP][431], [SKIP][432]) ([Intel XE#656])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][433] ([Intel XE#2313]) -> [SKIP][434] ([Intel XE#2312]) +4 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][435] ([Intel XE#2313]) -> ([SKIP][436], [SKIP][437]) ([Intel XE#2312]) +2 other tests ( 2 skip )
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][438] ([Intel XE#2312]) -> [SKIP][439] ([Intel XE#2313]) +7 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#656]) -> ([SKIP][441], [SKIP][442]) ([Intel XE#653] / [Intel XE#656]) +2 other tests ( 2 skip )
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#653]) -> ([SKIP][444], [SKIP][445]) ([Intel XE#653] / [Intel XE#656]) +22 other tests ( 2 skip )
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#656]) -> [SKIP][447] ([Intel XE#653]) +2 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][448] ([Intel XE#2312]) -> ([SKIP][449], [SKIP][450]) ([Intel XE#2313]) +5 other tests ( 2 skip )
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [FAIL][451] ([Intel XE#4426]) -> ([FAIL][452], [PASS][453]) ([Intel XE#4426]) +1 other test ( 1 fail, 1 pass )
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_hdr@static-toggle-dpms.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_hdr@static-toggle-dpms.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][454] ([Intel XE#616]) -> ([PASS][455], [FAIL][456]) ([Intel XE#616])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_plane_cursor@viewport.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_plane_cursor@viewport.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][457] ([Intel XE#2493]) -> ([SKIP][458], [SKIP][459]) ([Intel XE#2493] / [Intel XE#4596])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][460] ([Intel XE#4596]) -> ([SKIP][461], [SKIP][462]) ([Intel XE#2493] / [Intel XE#4596])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#455]) -> ([SKIP][464], [SKIP][465]) ([Intel XE#455] / [Intel XE#4596]) +1 other test ( 2 skip )
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-yf.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-yf.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][466] ([Intel XE#718]) -> ([FAIL][467], [PASS][468]) ([Intel XE#718])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#362]) -> ([FAIL][470], [FAIL][471]) ([Intel XE#1729])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][472] ([Intel XE#2509]) -> ([SKIP][473], [SKIP][474]) ([Intel XE#2426])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1500]) -> ([SKIP][476], [SKIP][477]) ([Intel XE#1500] / [Intel XE#362])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][478] ([Intel XE#771]) -> ([PASS][479], [FAIL][480]) ([Intel XE#771])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#1392]) -> ([PASS][482], [SKIP][483]) ([Intel XE#1392]) +4 other tests ( 1 pass, 1 skip )
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [FAIL][484] ([Intel XE#1999]) -> ([PASS][485], [FAIL][486]) ([Intel XE#1999]) +2 other tests ( 1 fail, 1 pass )
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#1061]) -> [FAIL][488] ([Intel XE#1173])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_peer2peer@write.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4259
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8297 -> IGTPW_12902
  * Linux: xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201 -> xe-2895-0d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526

  IGTPW_12902: 12902
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9180336b156148e201
  xe-2895-0d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526: 0d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/index.html

--===============3213247108850754747==
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
<tr><td><b>Series:</b></td><td>Add PMU tests for GT frequency</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147098/">https://patchwork.freedesktop.org/series/147098/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12902/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12902/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8297_FULL -&gt; XEIGTPW_12902_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12902_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12902_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
902_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
902/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">INCOMPLET=
E</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/sha=
rd-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">PASS</a>) +1 oth=
er test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>{igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_enhance0} (NEW=
):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@xe_pmu@gt-frequency@engine-drm_x=
e_engine_class_video_enhance0.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_enhance1} (NEW=
):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@xe_pmu@gt-frequency@engine-drm_x=
e_engine_class_video_enhance1.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8297_FULL and XEIGTPW_12902=
_FULL:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_copy0:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_render0:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_decode1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_enhance0:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency@engine-drm_xe_engine_class_video_enhance1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12902_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_addfb_basic@invalid-smem-bo=
-on-discrete.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12902/shard-lnl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discr=
ete.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12902/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomi=
c.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3701">Intel XE#3701</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_async_flips@alternate-sync-a=
sync-flip-atomic@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hd=
mi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transi=
tion-fencing@pipe-b-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_atomic_trans=
ition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-6.html">INCOMPLETE=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shar=
d-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pi=
pe-b-hdmi-a-6.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2613">Intel XE#2613</a>) +1 other test ( 1 incomplete, 1=
 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-1920=
x1080p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12902/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displ=
ays-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-dis=
plays-1920x1080p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12902/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-=
3840x2160p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12902/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-=
3840x2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12902/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x=
2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays=
-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12902/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-3840x2160=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_ccs@crc-primary-basic-y-til=
ed-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12902/shard-lnl-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
7">Intel XE#2887</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-t=
iled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_ccs@crc-primar=
y-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +52=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +36 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-=
tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +207 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-r=
c-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#=
3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-til=
ed-ccs@pipe-d-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-=
ccs@pipe-d-dp-2.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_chamelium_color@ctm-max.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_chamelium_frames@dp-crc-sin=
gle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12902/shard-lnl-5/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Inte=
l XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-wi=
th-enabled-mode.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-ena=
bled-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +3 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-with-=
enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_content_protection@atomic-dp=
ms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_content_protection@atomic@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_content_protection@uevent@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-mo=
vement-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-move=
ment-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12902/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-l=
egacy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_cursor_legacy@2x-long-non=
blocking-modeset-vs-cursor-atomic.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_cursor_legacy=
@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-fli=
pb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12902/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard=
-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12902/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-=
size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12902/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/309">Intel XE#309</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12902/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_cursor_leg=
acy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>) +5 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-4/igt@kms_cursor_legacy@torture-move.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard=
-adlp-9/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a=
>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_dp_aux_dev.html">PASS</a> -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_d=
p_aux_dev.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12902/shard-bmg-4/igt@kms_dp_aux_dev.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12902/shard-dg2-435/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE#=
4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrup=
tible.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12902/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-i=
nterruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12902/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-=
interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2316">Intel XE#2316</a>) +9 other tests ( 1 pass, 1 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@ad-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vb=
lank@bc-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_129=
02/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4=
/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_129=
02/shard-lnl-8/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>=
) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@2x-modeset-vs-vblank-race-interruptib=
le.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12902/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-d=
g2-435/igt@kms_flip@2x-nonexisting-fb.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_flip@2x-n=
onexisting-fb.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests ( 1 pass, 1 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bm=
g-4/igt@kms_flip@blocking-wf_vblank.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_flip@blocking=
-wf_vblank.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2882">Intel XE#2882</a>) +1 other test ( 1 fail, 1 pass )</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/=
shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@k=
ms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tes=
ts ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12902/shard-adlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
dp2.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12902/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@b-dp2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12902/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e@b-dp2.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3321">Intel XE#3321</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-ln=
l-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upsca=
ling@pipe-a-default-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-=
yftile-to-16bpp-yftile-downscaling.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_flip_scaled_cr=
c@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">In=
tel XE#1745</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-=
2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs=
-indfb-scaledprimary.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-=
indfb-scaledprimary.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests ( 2 skip )</=
li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-in=
dfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-mult=
idraw.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-ind=
fb-multidraw.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-in=
dfb-multidraw.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-pri-shrfb-draw-blt.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@fbc-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other =
tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-i=
ndfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb565-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb565-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_frontbuffer_=
tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel=
 XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-=
4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-=
bmg-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_hdr@stati=
c-toggle-suspend.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12902/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#=
2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_plane_cursor@overlay.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2=
-432/igt@kms_plane_cursor@overlay.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_plane_cursor@=
overlay.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-=
a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>) +1 other test abort</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@kms_plane_scaling@plane-downsca=
le-factor-0-5-with-modifiers.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-3/igt@kms_plane_scaling@plane-=
downscale-factor-0-5-with-modifiers.html">ABORT</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624=
</a>) +1 other test ( 1 abort, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@kms_plane_scaling@plane-downsca=
le-factor-0-5-with-modifiers@pipe-b.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-3/igt@kms_plane_scaling=
@plane-downscale-factor-0-5-with-modifiers@pipe-b.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_pm_backlight@bad-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2=
-463/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_pm_rpm@dpms-n=
on-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/836">Intel XE#836</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay=
-primary-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-pr=
imary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_psr2_sf@fbc=
-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4=
608</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_psr2_sf@pr-over=
lay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-m=
ove.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12902/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-m=
ove@edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12902/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_psr@pr-sprite-render.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1290=
2/shard-dg2-432/igt@kms_psr@pr-sprite-render.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel =
XE#929</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@kms_psr@pr-sprite-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/s=
hard-dg2-432/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt=
@kms_setmode@clone-exclusive-crtc.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_129=
02/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12902/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2902/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
35">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12902/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12902/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/771">Intel XE#771</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/i=
gt@kms_vrr@negative-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_vrr@negative-basic.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-drrs=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12902/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#=
1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear=
-0xfd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12902/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"=
>Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0=
x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-extende=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-8/igt@xe_eudebug@discovery-race-sigint=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4259">Intel XE#4259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_eudebug_online@reset-with-=
attention.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12902/shard-dg2-466/igt@xe_eudebug_online@reset-with-attention.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_eudebug_online@writes-cachi=
ng-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-5/igt@xe_evict@evict-beng-small.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
8">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-6/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bin=
d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12902/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-b=
ind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12902/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mm=
ap.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12902/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12902/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2902/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>) +8 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_exec_fault_mode@invalid-va=
-scratch-nopagefault.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@xe_exec_fault_mode@invalid-va-=
scratch-nopagefault.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@xe_exec_fault_mode@many-execqu=
eues-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_v=
alidate_ccs_kunit.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_valid=
ate_ccs_kunit.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@xe_module_load@force-load.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@xe_oa@oa-tlb-invalidate.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@xe_oa@privileged-forked-acces=
s-vaddr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12902/shard-dg2-435/igt@xe_oa@privileged-forked-access-vaddr.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-=
vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-8/igt@xe_pm@s4-basic.html">PASS</a> -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-7/igt@xe_pm=
@s4-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12902/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>) +2 other tests ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-adlp-9/igt=
@xe_pm@s4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-lnl-1/igt@xe_query@multigpu-query-topology=
-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12902/shard-dg2-432/igt@xe_query@multigpu-query-topology-l=
3-bank-mask.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/82=
7">Intel XE#827</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12902/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12902/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS=
</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard=
-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-d=
g2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-v=
s-cursor-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs=
-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_cursor_legacy@=
2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_curs=
or_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) +1 o=
ther test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12902/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legac=
y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12902/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-to=
ggle.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12902/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html=
">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12902/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-d=
g2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-=
dg2-466/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12902/shard-dg2-466/igt@kms_flip@2x-blocking-absolute-wf_vblank=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12902/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">PASS=
</a>) +5 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-2/igt@kms_flip@2x-flip-=
vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a>) +=
1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_flip@2x-flip=
-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> +2 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#=
310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2902/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12902/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard=
-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>) +2 other test=
s ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2882">Intel XE#2882</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank=
@a-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12902/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi=
-a3.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12902/shard-adlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank@=
c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a2.=
html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12902/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a2.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1.h=
tml">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12902/shard-adlp-4/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_frontbuffer_tracki=
ng@fbc-2p-primscrn-shrfb-plflip-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-6/igt@kms_plane_cursor@primary.html">INCOMPLETE</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard=
-lnl-5/igt@kms_plane_cursor@primary.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-8/igt@kms_plane_cursor@=
primary.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size=
-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_plane_cursor@viewport@pipe=
-a-hdmi-a-6-size-64.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel=
 XE#1435</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12902/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg=
-3/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12902/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_setmode@invalid-clone-single-=
crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278=
">Intel XE#4278</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12902/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2902/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many.html">PASS</a>=
) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@xe_exec_basic@multi=
gpu-many-execqueues-many-vm-null-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-u=
serptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@xe_exec_basic@mul=
tigpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a>) +2 othe=
r tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-=
xe_guc_relay_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-adlp-2/igt@xe_fault_=
injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-4/igt@xe_oa@buffer-size.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard=
-lnl-1/igt@xe_oa@buffer-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">I=
ntel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.=
html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_bw@connect=
ed-linear-tiling-2-displays-1920x1080p.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_bw@connect=
ed-linear-tiling-2-displays-1920x1080p.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#28=
94</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs=
@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_c=
cs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/sh=
ard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pi=
pe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-=
cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_ccs@missing=
-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-cc=
s@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms=
_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg=
2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787">Intel XE#787</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel =
XE#4522</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html=
">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12902/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">=
PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_129=
02/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-h=
dmi-a-6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12902/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-=
cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Int=
el XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12902/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12902/shard-dg2-466/igt@kms_content_protection@lic-type-0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12902/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_content_protection@srm.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#11=
78</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2902/shard-bmg-8/igt@kms_content_protection@srm.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_c=
ontent_protection@srm.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12902/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432=
/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cu=
rsor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_cursor_legacy@2x-=
nonblocking-modeset-vs-cursor-atomic.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_cursor_leg=
acy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12902/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flip=
b-varying-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-var=
ying-size.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a=
-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_dither@fb-8b=
pc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_dither@fb-8bpc=
-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Inte=
l XE#4354</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12902/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-b=
mg-1/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel X=
E#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12902/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/i=
gt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-=
off-vs-modeset-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_flip@2x-flip-vs-dp=
ms-off-vs-modeset-interruptible.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test (=
 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12902/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">In=
tel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_flip@2x-flip-=
vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-2/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
86">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12902/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-ed=
p1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12902/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/88=
6">Intel XE#886</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-mul=
tidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12902/shard-dg2-435/igt@kms_frontbuffer_tracking@d=
rrs-2p-pri-indfb-multidraw.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tracking=
@drrs-2p-pri-indfb-multidraw.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_=
frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Int=
el XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_=
frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312">Intel XE#2312</a>) +19 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_frontbuffer=
_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@km=
s_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_frontbuffer=
_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@km=
s_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Int=
el XE#656</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tracking@=
fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
141">Intel XE#4141</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_t=
racking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-c=
ur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-c=
ur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@km=
s_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>) +17 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-ind=
fb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_frontb=
uffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-in=
dfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-1/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@k=
ms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"=
>Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2313">Intel XE#2313</a>) +16 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
3">Intel XE#653</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_frontbuffer_t=
racking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-466/igt@kms_frontbuffer=
_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@km=
s_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Int=
el XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-463/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +22 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_frontbuffer_trackin=
g@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_hdr@static-toggle-dpms.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4426">Intel XE#=
4426</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12902/shard-dg2-435/igt@kms_hdr@static-toggle-dpms.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt=
@kms_hdr@static-toggle-dpms.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4426">Intel XE#4426</a>) +1 other test ( 1=
 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#61=
6</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
902/shard-dg2-463/igt@kms_plane_cursor@viewport.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@kms=
_plane_cursor@viewport.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel X=
E#2493</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12902/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-3/i=
gt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel =
XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12902/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-bmg-4=
/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596=
</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12902/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-dg2=
-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#45=
96</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/shard-=
lnl-6/igt@kms_pm_dc@dc5-psr.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/71=
8">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12902/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902=
/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE=
#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12902/shard-bmg-8/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12902/shard-bmg-4/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12902/shard-dg2-464/igt@kms_tiled_display@basic-t=
est-pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@kms_tiled_display@basic-=
test-pattern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12902/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@=
pipe-a-edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12902/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-=
a-edp-1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/771">Intel XE#771</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mma=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-mmap.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12902/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-b=
asic-defer-mmap.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests ( 1 pass, 1 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1999">Intel XE#1999</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12902/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live=
_mocs_kernel_kunit.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12902/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mo=
cs_kernel_kunit.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests ( 1 fail, 1 pa=
ss )</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12902/sh=
ard-dg2-464/igt@xe_peer2peer@write.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8297 -&gt; IGTPW_12902</li>
<li>Linux: xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201 -&gt; xe-2895-0=
d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526</li>
</ul>
<p>IGTPW_12902: 12902<br />
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9=
180336b156148e201<br />
  xe-2895-0d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526: 0d2ff6d7ad3b6bf64c5c0e9=
a921fcfa925029526</p>

</body>
</html>

--===============3213247108850754747==--
