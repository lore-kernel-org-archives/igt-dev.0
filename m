Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EAAC9830B
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 19:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1A810F141;
	Wed, 23 Sep 2026 19:29:08 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4718310F140;
 Wed, 23 Sep 2026 19:28:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8467727210509237166=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/amdgpu/amd=5Fhotplug?=
 =?utf-8?q?=3A_use_SUSPEND=5FSTATE=5FFREEZE_for_basic-suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aurabindo Pillai" <aurabindo.pillai@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 23 Sep 2026 19:28:19 -0000
Message-ID: <179019169927.196549.4585971500298214261@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922144258.1618587-1-aurabindo.pillai@amd.com>
In-Reply-To: <20260922144258.1618587-1-aurabindo.pillai@amd.com>
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

--===============8467727210509237166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_hotplug: use SUSPEND_STATE_FREEZE for basic-suspend
URL   : https://patchwork.freedesktop.org/series/174719/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9109_FULL -> XEIGTPW_15886_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15886_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15886_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15886_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@xe_pm@s4-exec-after.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15886_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-ptl:          NOTRUN -> [SKIP][2] ([Intel XE#7225])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#7265])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#7265])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][7] ([Intel XE#7774]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_atomic_transition@modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5947])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#6925])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5901])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#7085])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +8 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#607] / [Intel XE#7361])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-ptl:          NOTRUN -> [SKIP][15] ([Intel XE#5851])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#610] / [Intel XE#7387])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5808]) +12 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7679])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#7679]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#367]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5823] / [Intel XE#6918]) +9 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-8/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#5822]) +11 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +8 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652]) +17 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:
    - shard-bmg:          [PASS][26] -> [INCOMPLETE][27] ([Intel XE#7084] / [Intel XE#8150])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#3432]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#9311])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#9205]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2724] / [Intel XE#7449])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2325] / [Intel XE#7358])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#5824]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#8391]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7358]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2252]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#2252]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-4/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-1:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#9333]) +25 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-1.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#6969]) +15 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6969]) +15 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2390] / [Intel XE#6974])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6974])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#6974])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_content_protection@suspend-resume.html
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#7642]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#5846]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320]) +6 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#5900]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-8/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#5962]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][52] ([Intel XE#5962] / [Intel XE#7343])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2286] / [Intel XE#6035])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4210] / [Intel XE#7467])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4354] / [Intel XE#7386])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html
    - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#7386])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#9009])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#8265]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-4/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#5907]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@dsc:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#9287])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@vrr:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#8586]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#2316]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][63] -> [FAIL][64] ([Intel XE#5408] / [Intel XE#6266]) +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check@bc-dp2-hdmi-a3.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][65] -> [FAIL][66] ([Intel XE#301])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#301] / [Intel XE#3149])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#7178]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7179])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-9/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#5800] / [Intel XE#6312]) +8 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#6312]) +17 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#7061]) +6 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4141]) +17 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2311]) +52 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#7061] / [Intel XE#7356]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#7865]) +24 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#7061]) +6 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2313]) +47 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#5812]) +78 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-bmg:          [PASS][83] -> [FAIL][84] ([Intel XE#9313]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-2/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#5917] / [Intel XE#6174])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#6911] / [Intel XE#7466])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#6900])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#7591])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#7591])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2486])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-ptl:          NOTRUN -> [SKIP][91] ([Intel XE#6912])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#8303]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#7283]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#7283]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-ptl:          [PASS][96] -> [ABORT][97] ([Intel XE#9362]) +7 other tests abort
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#4596] / [Intel XE#5854])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#5020] / [Intel XE#7348])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#5020])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#6886]) +19 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][104] -> [FAIL][105] ([Intel XE#8399]) +2 other tests fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2505] / [Intel XE#7447])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html
    - shard-ptl:          NOTRUN -> [FAIL][107] ([Intel XE#7395])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@package-g7:
    - shard-ptl:          NOTRUN -> [SKIP][109] ([Intel XE#6813])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_pm_rpm@package-g7.html
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#6814] / [Intel XE#7428])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1489]) +7 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#5858] / [Intel XE#7304]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#5858]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][114] ([Intel XE#7304]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2387] / [Intel XE#7429])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-ptl:          NOTRUN -> [SKIP][116] ([Intel XE#1406]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-ptl:          NOTRUN -> [SKIP][117] ([Intel XE#1406] / [Intel XE#5835]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-8/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2234])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#7795])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-ptl:          NOTRUN -> [SKIP][121] ([Intel XE#5821])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2330] / [Intel XE#5813])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2413])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#1435] / [Intel XE#8695])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-ptl:          NOTRUN -> [SKIP][126] ([Intel XE#5910])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#6503]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-ptl:          NOTRUN -> [SKIP][128] ([Intel XE#5857])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-ptl:          [PASS][129] -> [FAIL][130] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-3/igt@kms_vrr@flip-basic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#1499] / [Intel XE#9271])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-ptl:          NOTRUN -> [SKIP][133] ([Intel XE#5764]) +9 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#8370]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_evict@evict-small-external-multi-queue.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-ptl:          NOTRUN -> [SKIP][135] ([Intel XE#6144])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_balancer@many-cm-virtual-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][136] ([Intel XE#7482]) +18 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@xe_exec_balancer@many-cm-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2322] / [Intel XE#7372]) +7 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][138] ([Intel XE#5575] / [Intel XE#7484]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][139] ([Intel XE#8374]) +12 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#8374]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd:
    - shard-ptl:          NOTRUN -> [SKIP][141] ([Intel XE#8364]) +29 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#8364]) +25 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#8369]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-ptl:          NOTRUN -> [SKIP][144] ([Intel XE#8369]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@many-mmap-shared-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#8589]) +11 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_system_allocator@many-mmap-shared-nomemset.html

  * igt@xe_exec_system_allocator@prefetch-sys-benchmark:
    - shard-bmg:          [PASS][146] -> [DMESG-WARN][147] ([Intel XE#9309] / [Intel XE#9331]) +1 other test dmesg-warn
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-9/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html

  * igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo:
    - shard-bmg:          [PASS][148] -> [DMESG-WARN][149] ([Intel XE#9309])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-4/igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc:
    - shard-bmg:          [PASS][150] -> [DMESG-WARN][151] ([Intel XE#9331]) +178 other tests dmesg-warn
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][152] ([Intel XE#9331]) +48 other tests dmesg-warn
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck:
    - shard-bmg:          [PASS][153] -> [SKIP][154] ([Intel XE#8589]) +38 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [FAIL][155] ([Intel XE#9096])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#8378]) +8 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][157] ([Intel XE#8378]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][158] -> [ABORT][159] ([Intel XE#8007])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-10/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-9/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-ptl:          NOTRUN -> [SKIP][160] ([Intel XE#5712])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-ptl:          NOTRUN -> [SKIP][161] ([Intel XE#5830] / [Intel XE#7453])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier:
    - shard-ptl:          NOTRUN -> [SKIP][162] ([Intel XE#5100] / [Intel XE#7408]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@xe_mmap@pci-membarrier.html

  * igt@xe_mmap@vram:
    - shard-ptl:          NOTRUN -> [SKIP][163] ([Intel XE#5776])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@xe_mmap@vram.html

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - shard-ptl:          NOTRUN -> [SKIP][164] ([Intel XE#6964]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@xe_multigpu_svm@mgpu-coherency-conflict.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#6964]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-6/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html

  * igt@xe_noexec_ping_pong@basic:
    - shard-ptl:          NOTRUN -> [SKIP][166] ([Intel XE#6259] / [Intel XE#7406])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@xe_noexec_ping_pong@basic.html

  * igt@xe_page_reclaim@many-vma-same-bo:
    - shard-ptl:          NOTRUN -> [SKIP][167] ([Intel XE#7793]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@xe_page_reclaim@many-vma-same-bo.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-ptl:          NOTRUN -> [SKIP][168] ([Intel XE#5780] / [Intel XE#7590])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#7590]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-ptl:          NOTRUN -> [SKIP][171] ([Intel XE#5741])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [PASS][172] -> [INCOMPLETE][173] ([Intel XE#8175]) +1 other test incomplete
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-10/igt@xe_pm@s3-mocs.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-6/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][174] ([Intel XE#6867])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][175] -> [ABORT][176] ([Intel XE#9362]) +2 other tests abort
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-2/igt@xe_pm@s4-basic.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-7/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [PASS][177] -> [ABORT][178] ([Intel XE#9362])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-8/igt@xe_pm@s4-mocs.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-7/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-ptl:          [PASS][179] -> [DMESG-WARN][180] ([Intel XE#7727])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_prefetch_fault@l2-prefetch-fault:
    - shard-ptl:          NOTRUN -> [SKIP][181] ([Intel XE#8815])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@xe_prefetch_fault@l2-prefetch-fault.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#944])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-ptl:          NOTRUN -> [SKIP][184] ([Intel XE#6019]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
    - shard-ptl:          NOTRUN -> [SKIP][185] ([Intel XE#7892])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-4/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-ptl:          [FAIL][186] -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-ptl:          [ABORT][188] ([Intel XE#9362]) -> [PASS][189] +8 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][190] ([Intel XE#301]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-ptl:          [SKIP][192] ([Intel XE#7308]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-4/igt@kms_hdmi_inject@inject-audio.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][194] ([Intel XE#8399]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [ABORT][196] ([Intel XE#9362]) -> [PASS][197] +3 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-1/igt@kms_vblank@ts-continuation-suspend.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-9/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][198] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - shard-bmg:          [DMESG-WARN][200] ([Intel XE#9331]) -> [PASS][201] +182 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise:
    - shard-bmg:          [DMESG-WARN][202] ([Intel XE#9309] / [Intel XE#9331]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [ABORT][204] ([Intel XE#8007]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-9/igt@xe_module_load@reload-no-display.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [INCOMPLETE][206] ([Intel XE#8175]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-9/igt@xe_pm@s3-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][208] ([Intel XE#1124]) -> [SKIP][209] ([Intel XE#8589])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][210] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][211] ([Intel XE#8589])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-1.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          [SKIP][212] ([Intel XE#8265]) -> [SKIP][213] ([Intel XE#8589])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][214] ([Intel XE#301]) -> [FAIL][215] ([Intel XE#301] / [Intel XE#3149])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][216] ([Intel XE#2311]) -> [SKIP][217] ([Intel XE#8589]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][218] ([Intel XE#2313]) -> [SKIP][219] ([Intel XE#8589]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][220] ([Intel XE#1489]) -> [SKIP][221] ([Intel XE#8589])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][222] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][223] ([Intel XE#2509] / [Intel XE#7437])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][224] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][225] ([Intel XE#8589]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault:
    - shard-bmg:          [SKIP][226] ([Intel XE#8374]) -> [SKIP][227] ([Intel XE#8589])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          [SKIP][228] ([Intel XE#8364]) -> [SKIP][229] ([Intel XE#8589])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-madvise:
    - shard-bmg:          [DMESG-WARN][230] ([Intel XE#9331]) -> [SKIP][231] ([Intel XE#8589]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-10/igt@xe_exec_system_allocator@many-large-execqueues-new-madvise.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-new-madvise.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
    - shard-bmg:          [SKIP][232] ([Intel XE#8378]) -> [SKIP][233] ([Intel XE#8589])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          [SKIP][234] ([Intel XE#7793]) -> [SKIP][235] ([Intel XE#8589])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-5/igt@xe_page_reclaim@prl-max-entries.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][236] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][237] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-5/igt@xe_peer2peer@write.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5712]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5712
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5830
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
  [Intel XE#5947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
  [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9205
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9287]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9287
  [Intel XE#9309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309
  [Intel XE#9311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9311
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331
  [Intel XE#9333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9109 -> IGTPW_15886
  * Linux: xe-5807-3413ca5893855693d3cc12697713842547261439 -> xe-5810-7cdd31de20cd320f9a1539bb5c3949275326f017

  IGTPW_15886: e1d6d93a954ad74e466944f157665c9ace354606 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9109: 65f84b280be2caf8ce376295d97987a808affdee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5807-3413ca5893855693d3cc12697713842547261439: 3413ca5893855693d3cc12697713842547261439
  xe-5810-7cdd31de20cd320f9a1539bb5c3949275326f017: 7cdd31de20cd320f9a1539bb5c3949275326f017

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/index.html

--===============8467727210509237166==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_hotplug: use SUSPEND_STATE_FREEZE for basic-suspend</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174719/">https://patchwork.freedesktop.org/series/174719/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9109_FULL -&gt; XEIGTPW_15886_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15886_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15886_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15886_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm@s4-exec-after:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@xe_pm@s4-exec-after.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15886_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225">Intel XE#7225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_atomic_transition@modeset-transition-fencing.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947">Intel XE#5947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851">Intel XE#5851</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-8/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_cdclk@mode-rejected-max-dotclock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9311">Intel XE#9311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9205">Intel XE#9205</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-7/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-4/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d@pipe-d-plane-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a>) +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_content_protection@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-8/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-4/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9287">Intel XE#9287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-9/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-2/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313">Intel XE#9313</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917">Intel XE#5917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174">Intel XE#6174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +7 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447">Intel XE#7447</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813">Intel XE#6813</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-8/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910">Intel XE#5910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-3/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_evict@evict-small-external-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@xe_exec_balancer@many-cm-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@xe_exec_reset@cm-multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_system_allocator@many-mmap-shared-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@prefetch-sys-benchmark:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-9/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309">Intel XE#9309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-4/igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309">Intel XE#9309</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) +178 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) +48 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-10/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-9/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5712">Intel XE#5712</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5830">Intel XE#5830</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@xe_multigpu_svm@mgpu-coherency-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-6/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong@basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-2/igt@xe_noexec_ping_pong@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259">Intel XE#6259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406">Intel XE#7406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@many-vma-same-bo:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@xe_page_reclaim@many-vma-same-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">Intel XE#5741</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-10/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-6/igt@xe_pm@s3-mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-6/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Intel XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-2/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-7/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-8/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-7/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-1/igt@xe_prefetch_fault@l2-prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-3/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-4/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-ptl-4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-ptl-3/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-1/igt@kms_vblank@ts-continuation-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-9/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">PASS</a> +182 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309">Intel XE#9309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-malloc-prefetch-madvise.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-9/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-8/igt@xe_module_load@reload-no-display.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-9/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-10/igt@xe_exec_system_allocator@many-large-execqueues-new-madvise.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-new-madvise.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-5/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/shard-bmg-5/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/shard-bmg-5/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9109 -&gt; IGTPW_15886</li>
<li>Linux: xe-5807-3413ca5893855693d3cc12697713842547261439 -&gt; xe-5810-7cdd31de20cd320f9a1539bb5c3949275326f017</li>
</ul>
<p>IGTPW_15886: e1d6d93a954ad74e466944f157665c9ace354606 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9109: 65f84b280be2caf8ce376295d97987a808affdee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5807-3413ca5893855693d3cc12697713842547261439: 3413ca5893855693d3cc12697713842547261439<br />
  xe-5810-7cdd31de20cd320f9a1539bb5c3949275326f017: 7cdd31de20cd320f9a1539bb5c3949275326f017</p>

</body>
</html>

--===============8467727210509237166==--
