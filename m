Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0F4E6F082
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 10:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFD810E1AD;
	Tue, 23 Dec 2025 10:32:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A188810E1AD;
 Tue, 23 Dec 2025 10:32:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6582588072716907934=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_plane_color_pipeline_t?=
 =?utf-8?q?ests_for_Intel_hardware_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 23 Dec 2025 10:32:28 -0000
Message-ID: <176648594864.113795.8660846574151870378@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
In-Reply-To: <20251219112606.1330425-1-swati2.sharma@intel.com>
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

--===============6582588072716907934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add plane color pipeline tests for Intel hardware (rev8)
URL   : https://patchwork.freedesktop.org/series/150455/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8674_FULL -> XEIGTPW_14264_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14264_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14264_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14264_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_color@plane-ctm3x4@pipe-b-edp-1 (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][3] +31 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_color@plane-ctm3x4@pipe-b-edp-1.html

  * {igt@kms_color@plane-lut3d-green-only@pipe-c-dp-2} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][4] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_color@plane-lut3d-green-only@pipe-c-dp-2.html

  * igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-256:
    - shard-bmg:          [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-256.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-256.html

  
New tests
---------

  New tests have been introduced between XEIGT_8674_FULL and XEIGTPW_14264_FULL:

### New IGT tests (65) ###

  * igt@kms_color@plane-ctm3x4:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.69, 3.51] s

  * igt@kms_color@plane-ctm3x4-lut1d:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.71, 3.62] s

  * igt@kms_color@plane-ctm3x4-lut1d@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_color@plane-ctm3x4-lut1d@pipe-a-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.69] s

  * igt@kms_color@plane-ctm3x4-lut1d@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_color@plane-ctm3x4-lut1d@pipe-b-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_color@plane-ctm3x4-lut1d@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_color@plane-ctm3x4-lut1d@pipe-c-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.43] s

  * igt@kms_color@plane-ctm3x4-lut1d@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_color@plane-ctm3x4@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_color@plane-ctm3x4@pipe-a-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.69] s

  * igt@kms_color@plane-ctm3x4@pipe-b-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.45] s

  * igt@kms_color@plane-ctm3x4@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_color@plane-ctm3x4@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_color@plane-ctm3x4@pipe-c-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.37] s

  * igt@kms_color@plane-ctm3x4@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_color@plane-lut1d:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.78, 3.46] s

  * igt@kms_color@plane-lut1d-ctm3x4:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.79, 3.54] s

  * igt@kms_color@plane-lut1d-ctm3x4-lut1d:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.80, 3.51] s

  * igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-a-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.64] s

  * igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-b-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.50] s

  * igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-c-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.35] s

  * igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_color@plane-lut1d-ctm3x4@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_color@plane-lut1d-ctm3x4@pipe-a-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.65] s

  * igt@kms_color@plane-lut1d-ctm3x4@pipe-b-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.47] s

  * igt@kms_color@plane-lut1d-ctm3x4@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_color@plane-lut1d-ctm3x4@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_color@plane-lut1d-ctm3x4@pipe-c-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_color@plane-lut1d-ctm3x4@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_color@plane-lut1d-lut1d:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.75, 3.68] s

  * igt@kms_color@plane-lut1d-lut1d@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_color@plane-lut1d-lut1d@pipe-a-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@plane-lut1d-lut1d@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_color@plane-lut1d-lut1d@pipe-b-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_color@plane-lut1d-lut1d@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_color@plane-lut1d-lut1d@pipe-c-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.44] s

  * igt@kms_color@plane-lut1d-lut1d@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_color@plane-lut1d-post-ctm3x4:
    - Statuses : 1 fail(s)
    - Exec time: [3.62] s

  * igt@kms_color@plane-lut1d-post-ctm3x4@pipe-a-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.68] s

  * igt@kms_color@plane-lut1d-post-ctm3x4@pipe-b-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.50] s

  * igt@kms_color@plane-lut1d-post-ctm3x4@pipe-c-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.44] s

  * igt@kms_color@plane-lut1d-pre-ctm3x4:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [1.77, 3.62] s

  * igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-a-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.68] s

  * igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-b-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.51] s

  * igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-c-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.42] s

  * igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_color@plane-lut1d@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_color@plane-lut1d@pipe-a-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.66] s

  * igt@kms_color@plane-lut1d@pipe-b-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.41] s

  * igt@kms_color@plane-lut1d@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_color@plane-lut1d@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_color@plane-lut1d@pipe-c-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.39] s

  * igt@kms_color@plane-lut1d@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_color@plane-lut3d-green-only:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_color@plane-lut3d-green-only@pipe-a-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@plane-lut3d-green-only@pipe-b-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@plane-lut3d-green-only@pipe-c-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@plane-lut3d-green-only@pipe-d-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14264_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#4665])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@intel_hwmon@hwmon-write.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1467]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2328])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2191])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1512])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#367])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#3432])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +9 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#4418])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2325])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#373]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_color@ctm-0-25@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][27] ([Intel XE#5545]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_color@ctm-0-25@pipe-d-dp-2.html

  * {igt@kms_color@plane-lut3d-green-only@pipe-d-dp-2} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#3297]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_color@plane-lut3d-green-only@pipe-d-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#3278])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2320]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2321])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1424]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2321]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2291]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#309]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][37] -> [FAIL][38] ([Intel XE#5299])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4210])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#4331])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2244])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_dsc@dsc-basic.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-bmg:          NOTRUN -> [CRASH][42] ([Intel XE#6706]) +1 other test crash
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_fb_coherency@memset-crc@mmap-offset-wc:
    - shard-lnl:          NOTRUN -> [CRASH][43] ([Intel XE#6706]) +1 other test crash
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#4422])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4156])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2373])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2316])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2316]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1421]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2293]) +11 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1401]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#651]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#656]) +18 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2311]) +30 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2312]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4141]) +11 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#6312])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2313]) +22 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2350])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [ABORT][63] ([Intel XE#6740])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1503])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6901])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#6900])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6911])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2925])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#6912])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#6912])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#599]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#5020])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#6886]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2392])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2505])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1439] / [Intel XE#836])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1439] / [Intel XE#3141])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#6814])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1406] / [Intel XE#2893]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1406] / [Intel XE#2387])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1128] / [Intel XE#1406])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1406]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@fbc-psr2-suspend@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#4609])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend@edp-1.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1406] / [Intel XE#2234])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1406] / [Intel XE#4692])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2330])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_sharpness_filter@filter-rotations:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#6503])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_sharpness_filter@filter-rotations.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1499])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1499])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@testdisplay:
    - shard-bmg:          [PASS][97] -> [ABORT][98] ([Intel XE#6740])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-10/igt@testdisplay.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@testdisplay.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#4837]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#4837]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@pagefault-read-stress:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#6665])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_eudebug_online@pagefault-read-stress.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#6665] / [Intel XE#6681])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#688]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2322]) +8 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1392]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#6874]) +11 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#6874]) +24 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#4943]) +7 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise:
    - shard-lnl:          NOTRUN -> [WARN][111] ([Intel XE#5786])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise.html

  * igt@xe_exec_system_allocator@many-stride-mmap-file:
    - shard-bmg:          [PASS][112] -> [SKIP][113] ([Intel XE#6703]) +28 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-mmap-file.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-file.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#6196])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4943]) +19 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc-race:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#6703]) +13 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc-race.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#584]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2459] / [Intel XE#2596])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143]) -> ([PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [SKIP][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169]) ([Intel XE#378])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-1/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-1/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-4/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-1/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-4/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-8/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-8/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-4/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-1/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-8/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@xe_module_load@load.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#2284] / [Intel XE#366])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-lnl:          NOTRUN -> [FAIL][171] ([Intel XE#6251]) +1 other test fail
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#4733]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#944]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#944]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_vm@out-of-memory:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#5745])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@xe_vm@out-of-memory.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [SKIP][176] ([Intel XE#6815]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@info:
    - shard-bmg:          [SKIP][178] ([Intel XE#2134]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@fbdev@info.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@fbdev@info.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [SKIP][180] ([Intel XE#5177] / [Intel XE#6703]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@intel_hwmon@hwmon-read.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [SKIP][182] ([Intel XE#6703]) -> [PASS][183] +728 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [FAIL][184] ([Intel XE#5993]) -> [PASS][185] +3 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][186] ([Intel XE#6054]) -> [PASS][187] +3 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][188] ([Intel XE#2291]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [SKIP][190] ([Intel XE#2316]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][192] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][194] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][195] +2 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][196] ([Intel XE#718]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-lnl:          [SKIP][198] ([Intel XE#6921]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@kms_pm_rpm@basic-pci-d3-state.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [SKIP][200] ([Intel XE#6693]) -> [PASS][201] +3 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-lnl:          [SKIP][202] ([Intel XE#6919]) -> [PASS][203] +2 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][204] ([Intel XE#2142]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_create@invalid-pad:
    - shard-bmg:          [SKIP][206] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][207] +10 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_create@invalid-pad.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@xe_create@invalid-pad.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][208] ([Intel XE#5625]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [SKIP][210] ([Intel XE#2229]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [FAIL][212] ([Intel XE#6251]) -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-bmg:          [FAIL][214] ([Intel XE#5937]) -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][216] ([Intel XE#6703]) -> [SKIP][217] ([Intel XE#2327]) +5 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][218] ([Intel XE#6703]) -> [SKIP][219] ([Intel XE#607])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][220] ([Intel XE#6703]) -> [SKIP][221] ([Intel XE#1124]) +14 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][222] ([Intel XE#6703]) -> [SKIP][223] ([Intel XE#2314] / [Intel XE#2894])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][224] ([Intel XE#6703]) -> [SKIP][225] ([Intel XE#367]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][226] ([Intel XE#6703]) -> [SKIP][227] ([Intel XE#2887]) +22 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][228] ([Intel XE#3862]) -> [SKIP][229] ([Intel XE#6703])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][230] ([Intel XE#2887]) -> [SKIP][231] ([Intel XE#6703]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][232] ([Intel XE#6703]) -> [SKIP][233] ([Intel XE#2724])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_cdclk@plane-scaling.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          [SKIP][234] ([Intel XE#6703]) -> [SKIP][235] ([Intel XE#2325]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-bmg:          [SKIP][236] ([Intel XE#2252]) -> [SKIP][237] ([Intel XE#6703])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][238] ([Intel XE#6703]) -> [SKIP][239] ([Intel XE#2252]) +9 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][240] ([Intel XE#6703]) -> [SKIP][241] ([Intel XE#2390])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][242] ([Intel XE#6703]) -> [SKIP][243] ([Intel XE#2341]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_content_protection@mei-interface.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][244] ([Intel XE#6703]) -> [SKIP][245] ([Intel XE#2320]) +6 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][246] ([Intel XE#6703]) -> [SKIP][247] ([Intel XE#2321])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][248] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][249] ([Intel XE#2320])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][250] ([Intel XE#6703]) -> [SKIP][251] ([Intel XE#4354]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][252] ([Intel XE#6703]) -> [SKIP][253] ([Intel XE#2244])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][254] ([Intel XE#6703]) -> [SKIP][255] ([Intel XE#4156])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][256] ([Intel XE#6703]) -> [SKIP][257] ([Intel XE#776])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][258] ([Intel XE#6703]) -> [SKIP][259] ([Intel XE#1138])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][260] ([Intel XE#2374]) -> [SKIP][261] ([Intel XE#6703])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-3/igt@kms_feature_discovery@psr1.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][262] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][263] ([Intel XE#301])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][264] ([Intel XE#6703]) -> [SKIP][265] ([Intel XE#2293] / [Intel XE#2380]) +6 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][266] ([Intel XE#2312]) -> [SKIP][267] ([Intel XE#6703])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][268] ([Intel XE#2312]) -> [SKIP][269] ([Intel XE#2311]) +3 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][270] ([Intel XE#6703]) -> [SKIP][271] ([Intel XE#4141]) +17 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][272] ([Intel XE#4141]) -> [SKIP][273] ([Intel XE#6703])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][274] ([Intel XE#4141]) -> [SKIP][275] ([Intel XE#2312]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][276] ([Intel XE#2312]) -> [SKIP][277] ([Intel XE#4141]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][278] ([Intel XE#6703]) -> [SKIP][279] ([Intel XE#2352]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][280] ([Intel XE#6703]) -> [SKIP][281] ([Intel XE#2311]) +31 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][282] ([Intel XE#2311]) -> [SKIP][283] ([Intel XE#2312]) +6 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][284] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][285] ([Intel XE#2311])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][286] ([Intel XE#6703]) -> [SKIP][287] ([Intel XE#2312]) +6 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][288] ([Intel XE#2313]) -> [SKIP][289] ([Intel XE#6703]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][290] ([Intel XE#6703]) -> [SKIP][291] ([Intel XE#2313]) +32 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][292] ([Intel XE#2313]) -> [SKIP][293] ([Intel XE#2312]) +5 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][294] ([Intel XE#2312]) -> [SKIP][295] ([Intel XE#2313]) +7 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][296] ([Intel XE#1503]) -> [ABORT][297] ([Intel XE#6740])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][298] ([Intel XE#6703]) -> [SKIP][299] ([Intel XE#4298])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][300] ([Intel XE#6703]) -> [SKIP][301] ([Intel XE#2486])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          [SKIP][302] ([Intel XE#4329]) -> [SKIP][303] ([Intel XE#4329] / [Intel XE#6912])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][304] ([Intel XE#6703]) -> [SKIP][305] ([Intel XE#2393])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][306] ([Intel XE#6703]) -> [SKIP][307] ([Intel XE#5021])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][308] ([Intel XE#6703]) -> [SKIP][309] ([Intel XE#6886])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][310] ([Intel XE#6703]) -> [SKIP][311] ([Intel XE#2938])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][312] ([Intel XE#6703]) -> [SKIP][313] ([Intel XE#3309])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][314] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][315] ([Intel XE#1406] / [Intel XE#1489]) +11 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][316] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][317] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@kms_psr@fbc-psr-primary-render.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][318] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][319] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][320] ([Intel XE#6703]) -> [SKIP][321] ([Intel XE#2330]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][322] ([Intel XE#6703]) -> [SKIP][323] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][324] ([Intel XE#6703]) -> [SKIP][325] ([Intel XE#6503]) +4 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][326] ([Intel XE#6703]) -> [SKIP][327] ([Intel XE#1499])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][328] ([Intel XE#6703]) -> [SKIP][329] ([Intel XE#6599])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][330] ([Intel XE#6703]) -> [SKIP][331] ([Intel XE#4837]) +9 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][332] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][333] ([Intel XE#4837])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-bmg:          [SKIP][334] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][335] ([Intel XE#6703])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@xe_eudebug_online@pagefault-read.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          [SKIP][336] ([Intel XE#6703]) -> [SKIP][337] ([Intel XE#4837] / [Intel XE#6665]) +7 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][338] ([Intel XE#6703]) -> [SKIP][339] ([Intel XE#5793])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][340] ([Intel XE#6703]) -> [SKIP][341] ([Intel XE#2322]) +8 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][342] ([Intel XE#6703]) -> [SKIP][343] ([Intel XE#6874]) +39 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
    - shard-bmg:          [SKIP][344] ([Intel XE#6703]) -> [SKIP][345] ([Intel XE#5007]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][346] ([Intel XE#4943]) -> [SKIP][347] ([Intel XE#6703])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge-nomemset.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          [SKIP][348] ([Intel XE#6703]) -> [SKIP][349] ([Intel XE#4943]) +26 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][350] ([Intel XE#6703]) -> [SKIP][351] ([Intel XE#6281])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][352] ([Intel XE#6703]) -> [SKIP][353] ([Intel XE#586])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_mmap@small-bar.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@xe_mmap@small-bar.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][354] ([Intel XE#6703]) -> [SKIP][355] ([Intel XE#5694])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][356] ([Intel XE#2284]) -> [SKIP][357] ([Intel XE#6703])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][358] ([Intel XE#6703]) -> [SKIP][359] ([Intel XE#2284]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][360] ([Intel XE#6703]) -> [SKIP][361] ([Intel XE#579])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][362] ([Intel XE#6703]) -> [SKIP][363] ([Intel XE#4733]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          [SKIP][364] ([Intel XE#4733]) -> [SKIP][365] ([Intel XE#6703])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-3/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][366] ([Intel XE#6703]) -> [SKIP][367] ([Intel XE#944]) +6 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6706]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6919
  [Intel XE#6921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6921
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8674 -> IGTPW_14264
  * Linux: xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 -> xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9

  IGTPW_14264: 50b88b71a71950b095cf8e4ef831d8bc80497726 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7: e0eb6ad399f8369d978ca40f07cbf5c6c16647d7
  xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9: f101d56dc32350daa45c130ff7a6d46512f614a9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/index.html

--===============6582588072716907934==
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
<tr><td><b>Series:</b></td><td>Add plane color pipeline tests for Intel har=
dware (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/150455/">https://patchwork.freedesktop.org/series/150455/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14264/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14264/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8674_FULL -&gt; XEIGTPW_14264_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14264_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_14264_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14=
264_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-4/igt@core_setmaster@master-drop-set-shared-fd.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
264/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4@pipe-b-edp-1 (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_color@plane-ctm3x4@pipe-b-ed=
p-1.html">FAIL</a> +31 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_color@plane-lut3d-green-only@pipe-c-dp-2} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_color@plane-lut3d-green-only=
@pipe-c-dp-2.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-4/igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-256.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14264/shard-bmg-2/igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-256.html=
">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8674_FULL and XEIGTPW_14264=
_FULL:</p>
<h3>New IGT tests (65)</h3>
<ul>
<li>
<p>igt@kms_color@plane-ctm3x4:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.69, 3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4-lut1d:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.71, 3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4-lut1d@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4-lut1d@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4-lut1d@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4-lut1d@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4-lut1d@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4-lut1d@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4-lut1d@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-ctm3x4@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.78, 3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.79, 3.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.80, 3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4-lut1d@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-ctm3x4@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-lut1d:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.75, 3.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-lut1d@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-lut1d@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-lut1d@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-lut1d@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-lut1d@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-lut1d@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-lut1d@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-post-ctm3x4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-post-ctm3x4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-post-ctm3x4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [1.77, 3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d-pre-ctm3x4@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut1d@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut3d-green-only:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut3d-green-only@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut3d-green-only@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut3d-green-only@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@plane-lut3d-green-only@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14264_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-4/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/i=
gt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_big_fb@x-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
67">Intel XE#1467</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
28">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs@pipe-b-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@kms_ccs@random-ccs-data-y-tiled-=
gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-after=
-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm=
-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_color@ctm-0-25@pipe-d-dp-2.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5545">Intel XE#5545</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>{igt@kms_color@plane-lut3d-green-only@pipe-d-dp-2} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_color@plane-lut3d-green-only=
@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3297">Intel XE#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-move=
ment-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14264/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">=
Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_142=
64/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel =
XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_dsc@dsc-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Int=
el XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_fb_coherency@memset-crc.html=
">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6706">Intel XE#6706</a>) +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc@mmap-offset-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@kms_fb_coherency@memset-crc@mmap=
-offset-wc.html">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6706">Intel XE#6706</a>) +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
56">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_feature_discovery@display-3=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-b=
mg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_flip@2x-plain-flip-fb-recrea=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rg=
b101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-f=
bc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-=
a-3.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_hdr@static-toggle.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">=
Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6911">Intel XE#6911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6912">Intel XE#6912</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@kms_plane_lowres@tiling-x@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/599">Intel XE#599</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">In=
tel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
9">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_pm_rpm@package-g7.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">=
Intel XE#6814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#=
4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-e=
dp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4=
608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@kms_psr2_sf@pr-cursor-plane-upda=
te-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_psr2_sf@psr2-plane-move-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend@edp-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip=
</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_rotation_crc@primary-yf-til=
ed-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-rotations:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_sharpness_filter@filter-rota=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-vrr.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-10/igt@testdisplay.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@testdisp=
lay.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_eudebug@basic-vm-bind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/483=
7">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@xe_eudebug@discovery-empty.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@xe_eudebug_online@breakpoint-man=
y-sessions-tiles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_eudebug_online@pagefault-read=
-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_eudebug_online@pagefault-writ=
e-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6665">Intel XE#6665</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_eudebug_online@writes-caching=
-sram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_evict@evict-beng-threads-larg=
e-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>=
) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#139=
2</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@xe_exec_multi_queue@many-queues-=
preempt-mode-fault-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +11 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-p=
riority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6874">Intel XE#6874</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@xe_exec_system_allocator@many-ex=
ecqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@xe_exec_system_allocator@many-st=
ride-malloc-prefetch-madvise.html">WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-file:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-mmap-file.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14264/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-file.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@xe_exec_system_allocator@pat-ind=
ex-madvise-pat-idx-uc-comp-multi-vma.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@xe_exec_system_allocator@process=
-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +19 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-=
malloc-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_exec_system_allocator@threads=
-shared-vm-shared-alloc-many-stride-malloc-race.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@xe_gt_freq@freq_suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584"=
>Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/245=
9">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8674/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8674/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8674/shard-lnl-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-ln=
l-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard=
-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/sh=
ard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
674/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8674/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8674/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14264/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/s=
hard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14264/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14264/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1426=
4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14264/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14264/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14264/shard-lnl-1/igt@xe_module_load@load.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shar=
d-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4264/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14264/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14264/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Inte=
l XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-5/igt@xe_pm@d3cold-mmap-system.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-=
50.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6251">Intel XE#6251</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-te=
rmination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@xe_query@multigpu-query-topology=
-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@xe_vm@out-of-memory.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745">In=
tel XE#5745</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815">Intel=
 XE#6815</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14264/shard-bmg-4/igt@device_reset@unbind-reset-rebind.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@fbdev@info.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/=
igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14264/shard-bmg-3/igt@intel_hwmon@hwmon-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14264/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html">PASS</a> +728 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5993">Intel XE#5993</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14264/shard-lnl-7/igt@kms_async_flips@async-flip=
-with-page-flip-events-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-8/igt@kms_as=
ync_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html"=
>PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14264/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@kms_flip@flip-vs-=
expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_flip@flip-vs-suspen=
d-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-=
lnl-4/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-5/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6921">Intel XE=
#6921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14264/shard-lnl-7/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/sh=
ard-bmg-7/igt@kms_pm_rpm@basic-rte.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-rpm.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6919">In=
tel XE#6919</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14264/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-rpm.html">PASS=
</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14264/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual=
@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_create@invalid-pad:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_create@invalid-pad.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14264/shard-bmg-7/igt@xe_create@invalid-pad.html">PASS</a> +10 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-single-vma.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-4/igt@xe_exec_system_al=
locator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2229">Intel XE#2229</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14264/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validat=
e_ccs_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Int=
el XE#6251</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14264/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5937">Intel XE#5937</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14264/shard-bmg-9/igt@xe_sriov_auto_provisioning@selfconfig-=
basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14264/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">In=
tel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14264/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">In=
tel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2=
160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14264/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2160x14=
40p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-=
mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3862">Intel XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tile=
d-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1426=
4/shard-bmg-9/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">=
Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14264/shard-bmg-1/igt@kms_chamelium_color@ctm-limited-range.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
25">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-non=
-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-str=
ess-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel X=
E#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14264/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2=
252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14264/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">I=
ntel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14264/shard-bmg-10/igt@kms_content_protection@mei-interface.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/234=
1">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14264/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-max-size.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2320">Intel XE#2320</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">I=
ntel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14264/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321=
">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-1/igt@kms_cursor_crc@cursor-ra=
pid-movement-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14264/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#435=
4</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14264/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard=
-bmg-10/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_142=
64/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14264/shard-bmg-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel =
XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#23=
74</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
264/shard-bmg-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14264/shard-lnl-2/igt@kms_flip@flip-vs-expired=
-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_flip_scaled_=
crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380"=
>Intel XE#2380</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-10/igt@kms_frontbuffer_tracking=
@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_frontbuffer_tracki=
ng@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +17 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-=
plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shr=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">=
Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14264/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
52">Intel XE#2352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri=
-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shr=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shr=
fb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-9/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcps=
r-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr=
-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/sha=
rd-bmg-8/igt@kms_hdr@invalid-hdr.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14264/shard-bmg-10/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel X=
E#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14264/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel =
XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329"=
>Intel XE#4329</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14264/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_142=
64/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14264/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE=
#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale=
-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_plane_scaling@pla=
nes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">=
Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14264/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
38">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14264/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#330=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-4/igt@kms_psr2_sf@pr-prima=
ry-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-7/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel X=
E#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@kms_psr@fbc-psr-primary=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE=
#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14264/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14264/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2330">Intel XE#2330</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14264/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">=
Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14264/shard-bmg-2/igt@kms_sharpness_filter@filter-formats.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">=
Intel XE#6503</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14264/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_142=
64/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14264/shard-bmg-8/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">In=
tel XE#4837</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
57">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14264/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-u=
fence-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-7/igt@xe_eudebug_online@pagefault-read.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel=
 XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6665">Intel XE#6665</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_eudebug_online@pagefault-read.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14264/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-faulta=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14264/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#579=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14264/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault=
-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-7/igt@xe_exec_multi_q=
ueue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874=
</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14264/shard-bmg-1/igt@xe_exec_system_allocator@many-64k-=
mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5007">Intel XE#5007</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-new-huge-nomem=
set:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-execqueues=
-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-2/igt@xe_exec_sy=
stem_allocator@threads-many-execqueues-mmap-new-huge-nomemset.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg=
-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp=
_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@xe_fault_injection=
@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard=
-bmg-4/igt@xe_mmap@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14264/shard-=
bmg-7/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2=
284</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4264/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
264/shard-bmg-3/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4264/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4264/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-3/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">In=
tel XE#4733</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14264/shard-bmg-2/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">=
Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mb=
z.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14264/shard-bmg-8/igt@xe_query@multigpu-query-invalid-=
uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>) +6 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8674 -&gt; IGTPW_14264</li>
<li>Linux: xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 -&gt; xe-4295-f=
101d56dc32350daa45c130ff7a6d46512f614a9</li>
</ul>
<p>IGTPW_14264: 50b88b71a71950b095cf8e4ef831d8bc80497726 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7: e0eb6ad399f8369d978ca40=
f07cbf5c6c16647d7<br />
  xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9: f101d56dc32350daa45c130=
ff7a6d46512f614a9</p>

</body>
</html>

--===============6582588072716907934==--
