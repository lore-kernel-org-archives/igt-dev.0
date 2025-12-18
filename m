Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE7DD68BF4
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 08:49:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8644910E271;
	Thu, 18 Dec 2025 08:49:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE2010E271;
 Thu, 18 Dec 2025 08:49:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2430515656968508438=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fgt=5Ffreq?=
 =?utf-8?q?=3A_Modify_test_to_support_new_throttle_reasons_sysfs_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anirban, Sk" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 18 Dec 2025 08:49:39 -0000
Message-ID: <176604777973.99950.15414221673033416434@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217090146.1558855-4-sk.anirban@intel.com>
In-Reply-To: <20251217090146.1558855-4-sk.anirban@intel.com>
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

--===============2430515656968508438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_gt_freq: Modify test to support new throttle reasons sysfs (rev5)
URL   : https://patchwork.freedesktop.org/series/157903/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8669_FULL -> XEIGTPW_14225_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14225_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14225_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14225_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-2.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][2] -> [DMESG-WARN][3] +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-lnl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][4] ([Intel XE#1178]) -> [TIMEOUT][5] +1 other test timeout
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-8/igt@kms_content_protection@legacy.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_content_protection@legacy.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14225_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#6779])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@core_hotunplug@unplug-rescan.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#2134])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@fbdev@unaligned-read.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@fbdev@unaligned-read.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#5177] / [Intel XE#6703])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@intel_hwmon@hwmon-read.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#6054]) +3 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3279])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2327]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1407]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#610])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1467])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2191])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1512])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#367]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +9 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2669]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#3432])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2325]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#373]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2252]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#3278]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1424])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2320]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2321])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2321])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][38] -> [FAIL][39] ([Intel XE#5299])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2286])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1508])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#4354])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-3/igt@kms_dp_link_training@uhbr-sst.html
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4354]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2244]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2244]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2316]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#6557] / [Intel XE#6703]) +7 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-8/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2316]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][51] -> [FAIL][52] ([Intel XE#5408] / [Intel XE#5416] / [Intel XE#6266]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][53] -> [FAIL][54] ([Intel XE#5416] / [Intel XE#6266]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-dp2-hdmi-a3.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1401]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1397]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2311]) +19 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#4141]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2352])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6703]) +224 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#651]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2313]) +19 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2312]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#656]) +19 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [PASS][69] -> [ABORT][70] ([Intel XE#6740]) +1 other test abort
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][71] ([Intel XE#6740]) +1 other test abort
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#3374] / [Intel XE#3544])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4298])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#6557] / [Intel XE#6703]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#6886]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#6886]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#870]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#718])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#6693])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#6693]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1439] / [Intel XE#3141])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1406] / [Intel XE#1489]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1406] / [Intel XE#4608]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#6703]) +9 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1406]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1406] / [Intel XE#4609])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#1406] / [Intel XE#2234])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-1/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#6361]) +2 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vblank@query-idle-hang:
    - shard-bmg:          [PASS][96] -> [DMESG-WARN][97] ([Intel XE#5254]) +2 other tests dmesg-warn
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_vblank@query-idle-hang.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_vblank@query-idle-hang.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][98] -> [FAIL][99] ([Intel XE#2142]) +1 other test fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1499])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1499])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#6599])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#4837]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#4837]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_evict@evict-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#688]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][108] ([Intel XE#3428])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1392]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2322]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#6874]) +13 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-8/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#6874]) +22 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#4943]) +6 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-3/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:
    - shard-bmg:          [PASS][114] -> [SKIP][115] ([Intel XE#6703]) +513 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html

  * igt@xe_exec_system_allocator@once-malloc-prefetch-madvise:
    - shard-lnl:          NOTRUN -> [WARN][116] ([Intel XE#5786])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@xe_exec_system_allocator@once-malloc-prefetch-madvise.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#4943]) +19 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][118] ([Intel XE#5466])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2229])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2427]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#5694])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2284]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#2284] / [Intel XE#366])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#584])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
    - shard-lnl:          [PASS][125] -> [FAIL][126] ([Intel XE#6251])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#4733]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#944])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#4130])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [FAIL][130] ([Intel XE#6569])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#4351])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_vm@out-of-memory:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#5745])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@xe_vm@out-of-memory.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [SKIP][133] ([Intel XE#6779]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@core_hotunplug@hotrebind.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@core_hotunplug@hotrebind.html

  * igt@fbdev@pan:
    - shard-bmg:          [SKIP][135] ([Intel XE#2134]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@fbdev@pan.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@fbdev@pan.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][137] ([Intel XE#4665]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@intel_hwmon@hwmon-write.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][139] ([Intel XE#2291]) -> [PASS][140] +2 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][141] ([Intel XE#3009]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_dp_aux_dev.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][143] ([Intel XE#2316]) -> [PASS][144] +5 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][145] ([Intel XE#3428] / [Intel XE#5208]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][147] ([Intel XE#3428]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [SKIP][149] ([Intel XE#6703]) -> [PASS][150] +510 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][151] ([Intel XE#4596]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][153] ([Intel XE#718]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [SKIP][155] ([Intel XE#6693]) -> [PASS][156] +2 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][157] ([Intel XE#6321]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:
    - shard-bmg:          [SKIP][159] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][160] +4 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][161] ([Intel XE#2229]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [FAIL][163] -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_module_load@reload.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_module_load@reload.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][165] ([Intel XE#2370]) -> [SKIP][166] ([Intel XE#6703]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][167] ([Intel XE#6703]) -> [SKIP][168] ([Intel XE#2327]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][169] ([Intel XE#2327]) -> [SKIP][170] ([Intel XE#6703]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][171] ([Intel XE#6703]) -> [SKIP][172] ([Intel XE#1124]) +9 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][173] ([Intel XE#1124]) -> [SKIP][174] ([Intel XE#6703]) +8 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][175] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][176] ([Intel XE#6703]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][177] ([Intel XE#6703]) -> [SKIP][178] ([Intel XE#2314] / [Intel XE#2894])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          [SKIP][179] ([Intel XE#6703]) -> [SKIP][180] ([Intel XE#367]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][181] ([Intel XE#367]) -> [SKIP][182] ([Intel XE#6703])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][183] ([Intel XE#6703]) -> [SKIP][184] ([Intel XE#2887]) +11 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][185] ([Intel XE#3432]) -> [SKIP][186] ([Intel XE#6703])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][187] ([Intel XE#6703]) -> [SKIP][188] ([Intel XE#3432])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][189] ([Intel XE#2887]) -> [SKIP][190] ([Intel XE#6703]) +10 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][191] ([Intel XE#6703]) -> [SKIP][192] ([Intel XE#2652] / [Intel XE#787])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][193] ([Intel XE#2325]) -> [SKIP][194] ([Intel XE#6703]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][195] ([Intel XE#6703]) -> [SKIP][196] ([Intel XE#2325]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_chamelium_color@degamma.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][197] ([Intel XE#2252]) -> [SKIP][198] ([Intel XE#6703]) +7 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          [SKIP][199] ([Intel XE#6703]) -> [SKIP][200] ([Intel XE#2252]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][201] ([Intel XE#1178]) -> [SKIP][202] ([Intel XE#2341])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-3/igt@kms_content_protection@lic-type-0.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][203] ([Intel XE#6703]) -> [SKIP][204] ([Intel XE#2341])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_content_protection@type1.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][205] ([Intel XE#2341]) -> [SKIP][206] ([Intel XE#6703])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_content_protection@uevent.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          [SKIP][207] ([Intel XE#6703]) -> [SKIP][208] ([Intel XE#2320]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][209] ([Intel XE#2321]) -> [SKIP][210] ([Intel XE#6703]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][211] ([Intel XE#6703]) -> [SKIP][212] ([Intel XE#2321])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-bmg:          [SKIP][213] ([Intel XE#2320]) -> [SKIP][214] ([Intel XE#6703]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][215] ([Intel XE#6703]) -> [SKIP][216] ([Intel XE#2291])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][217] ([Intel XE#6715]) -> [SKIP][218] ([Intel XE#6703])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][219] ([Intel XE#1508]) -> [SKIP][220] ([Intel XE#6703])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][221] ([Intel XE#6703]) -> [SKIP][222] ([Intel XE#4331])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][223] ([Intel XE#4422]) -> [SKIP][224] ([Intel XE#6703])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][225] ([Intel XE#4156]) -> [SKIP][226] ([Intel XE#6703])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][227] ([Intel XE#6703]) -> [SKIP][228] ([Intel XE#2372])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][229] ([Intel XE#6703]) -> [SKIP][230] ([Intel XE#2373])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][231] ([Intel XE#6703]) -> [SKIP][232] ([Intel XE#2374])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][233] ([Intel XE#2316]) -> [SKIP][234] ([Intel XE#6703]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][235] ([Intel XE#6703]) -> [SKIP][236] ([Intel XE#2316])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][237] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][238] ([Intel XE#6703]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][239] ([Intel XE#6703]) -> [SKIP][240] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][241] ([Intel XE#2311]) -> [SKIP][242] ([Intel XE#6703]) +19 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][243] ([Intel XE#2311]) -> [SKIP][244] ([Intel XE#2312])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][245] ([Intel XE#6703]) -> [SKIP][246] ([Intel XE#2311]) +16 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][247] ([Intel XE#4141]) -> [SKIP][248] ([Intel XE#6703]) +6 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][249] ([Intel XE#6703]) -> [SKIP][250] ([Intel XE#4141]) +12 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][251] ([Intel XE#4141]) -> [SKIP][252] ([Intel XE#2312]) +4 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][253] ([Intel XE#2312]) -> [SKIP][254] ([Intel XE#4141]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][255] ([Intel XE#2311]) -> [SKIP][256] ([Intel XE#6314])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][257] ([Intel XE#2312]) -> [SKIP][258] ([Intel XE#6703]) +7 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][259] ([Intel XE#2312]) -> [SKIP][260] ([Intel XE#2311]) +6 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][261] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][262] ([Intel XE#2311])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][263] ([Intel XE#2313]) -> [SKIP][264] ([Intel XE#2312]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][265] ([Intel XE#6703]) -> [SKIP][266] ([Intel XE#2313]) +22 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][267] ([Intel XE#6703]) -> [SKIP][268] ([Intel XE#2312]) +7 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][269] ([Intel XE#2352]) -> [SKIP][270] ([Intel XE#6703])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][271] ([Intel XE#2312]) -> [SKIP][272] ([Intel XE#2313]) +11 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][273] ([Intel XE#2313]) -> [SKIP][274] ([Intel XE#6703]) +16 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [ABORT][275] ([Intel XE#6740]) -> [SKIP][276] ([Intel XE#6703]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][277] ([Intel XE#6703]) -> [SKIP][278] ([Intel XE#3374] / [Intel XE#3544])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][279] ([Intel XE#6901]) -> [SKIP][280] ([Intel XE#6703])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][281] ([Intel XE#6703]) -> [SKIP][282] ([Intel XE#5624])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][283] ([Intel XE#6703]) -> [SKIP][284] ([Intel XE#4596])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][285] ([Intel XE#6703]) -> [SKIP][286] ([Intel XE#5020])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][287] ([Intel XE#6703]) -> [SKIP][288] ([Intel XE#6886])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][289] ([Intel XE#6703]) -> [SKIP][290] ([Intel XE#2938])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][291] ([Intel XE#870]) -> [SKIP][292] ([Intel XE#6703])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][293] ([Intel XE#2391]) -> [SKIP][294] ([Intel XE#6703])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][295] ([Intel XE#6693]) -> [SKIP][296] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][297] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][298] ([Intel XE#1406] / [Intel XE#6703]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][299] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][300] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][301] ([Intel XE#1406] / [Intel XE#2387]) -> [SKIP][302] ([Intel XE#1406] / [Intel XE#6703])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-bmg:          [SKIP][303] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][304] ([Intel XE#1406] / [Intel XE#6703]) +5 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@kms_psr@fbc-pr-primary-page-flip.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][305] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][306] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][307] ([Intel XE#2330]) -> [SKIP][308] ([Intel XE#6703])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][309] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][310] ([Intel XE#6703]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][311] ([Intel XE#2413]) -> [SKIP][312] ([Intel XE#6703])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][313] ([Intel XE#1435]) -> [SKIP][314] ([Intel XE#6703])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          [SKIP][315] ([Intel XE#6703]) -> [SKIP][316] ([Intel XE#6503]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_sharpness_filter@filter-toggle.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][317] ([Intel XE#6503]) -> [SKIP][318] ([Intel XE#6703]) +2 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][319] ([Intel XE#6703]) -> [SKIP][320] ([Intel XE#1499])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@kms_vrr@flip-dpms.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][321] ([Intel XE#1499]) -> [SKIP][322] ([Intel XE#6703]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          [SKIP][323] ([Intel XE#6599]) -> [SKIP][324] ([Intel XE#6703])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@xe_compute@eu-busy-10s.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_compute@eu-busy-10s.html

  * igt@xe_eudebug@basic-client-th:
    - shard-bmg:          [SKIP][325] ([Intel XE#6703]) -> [SKIP][326] ([Intel XE#4837]) +4 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_eudebug@basic-client-th.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_eudebug@basic-client-th.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-bmg:          [SKIP][327] ([Intel XE#4837]) -> [SKIP][328] ([Intel XE#6703]) +4 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-3/igt@xe_eudebug@basic-vm-access-faultable.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-bmg:          [SKIP][329] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][330] ([Intel XE#6703]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@xe_eudebug_online@interrupt-all.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-bmg:          [SKIP][331] ([Intel XE#6665] / [Intel XE#6681]) -> [SKIP][332] ([Intel XE#6703])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@xe_eudebug_online@pagefault-write-stress.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][333] ([Intel XE#6703]) -> [SKIP][334] ([Intel XE#4837] / [Intel XE#6665]) +6 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_eudebug_online@single-step.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][335] ([Intel XE#6703]) -> [SKIP][336] ([Intel XE#5793])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [SKIP][337] ([Intel XE#6703]) -> [INCOMPLETE][338] ([Intel XE#6321])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][339] ([Intel XE#6703]) -> [SKIP][340] ([Intel XE#2322]) +7 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][341] ([Intel XE#2322]) -> [SKIP][342] ([Intel XE#6703]) +6 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][343] ([Intel XE#6703]) -> [SKIP][344] ([Intel XE#6874]) +22 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          [SKIP][345] ([Intel XE#6874]) -> [SKIP][346] ([Intel XE#6703]) +34 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][347] ([Intel XE#5007]) -> [SKIP][348] ([Intel XE#6703])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][349] ([Intel XE#6703]) -> [SKIP][350] ([Intel XE#5007])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
    - shard-bmg:          [SKIP][351] ([Intel XE#4943]) -> [SKIP][352] ([Intel XE#6703]) +12 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][353] ([Intel XE#6703]) -> [SKIP][354] ([Intel XE#4943]) +21 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [SKIP][361], [PASS][362], [ABORT][363], [ABORT][364], [ABORT][365], [ABORT][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380]) ([Intel XE#2457] / [Intel XE#6887]) -> ([PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [SKIP][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404]) ([Intel XE#2457])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-3/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-3/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-6/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-6/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-6/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-6/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-7/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-8/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-7/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-8/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][405] ([Intel XE#2284]) -> [SKIP][406] ([Intel XE#6703]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-8/igt@xe_pm@d3cold-basic.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][407] ([Intel XE#6703]) -> [SKIP][408] ([Intel XE#5694])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][409] ([Intel XE#6703]) -> [SKIP][410] ([Intel XE#2284]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          [SKIP][411] ([Intel XE#6703]) -> [SKIP][412] ([Intel XE#4733]) +2 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_pxp@pxp-optout.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_pxp@pxp-optout.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][413] ([Intel XE#4733]) -> [SKIP][414] ([Intel XE#6703]) +2 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][415] ([Intel XE#6703]) -> [SKIP][416] ([Intel XE#944])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][417] ([Intel XE#944]) -> [SKIP][418] ([Intel XE#6703]) +2 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5254
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5416
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6887
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8669 -> IGTPW_14225

  IGTPW_14225: 14225
  IGT_8669: 319db2ffba419f9711acc72895f065a818905efa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0: 2eb2f8746a879f1c0e4c56b715c179424dafd8e0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/index.html

--===============2430515656968508438==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_gt_freq: Modify test to suppo=
rt new throttle reasons sysfs (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/157903/">https://patchwork.freedesktop.org/series/157903/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14225/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14225/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8669_FULL -&gt; XEIGTPW_14225_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14225_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_14225_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14=
225_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_pipe_crc_basic@compare-crc-s=
anitycheck-nv12@pipe-c-dp-2.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-lnl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14225/shard-lnl-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.=
html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@legacy:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-8/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14225/shard-bmg-4/igt@kms_content_protection@legacy.html">TIMEOUT</a> +1 o=
ther test timeout</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14225_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bm=
g-5/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@=
fbdev@unaligned-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@intel_hwmon@hwmon-read.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/ig=
t@intel_hwmon@hwmon-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear-atomic@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-5/igt@kms_async_flips@asyn=
c-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#=
6054</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
67">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other te=
st skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-=
y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-enable-=
disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-=
256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_142=
25/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel =
XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-3/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4354">Intel XE#4354</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4354">Intel XE#4354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank-interruptible.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14225/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
16">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-8/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-b=
mg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14225/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5408">Intel XE#5408</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5416">Intel XE#5416</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac=
-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-int=
erruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5416">Intel XE#5416</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 oth=
er test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE=
#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-l=
inear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-l=
inear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#13=
97</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-til=
ing-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +224 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-=
pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +19 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-=
3/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other tes=
t abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_hdr@bpc-switch@pipe-a-dp-2.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_pipe_crc_basic@disable-crc-a=
fter-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">I=
ntel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-lnl-1/igt@k=
ms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-=
bmg-5/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel X=
E#6693</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">In=
tel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Int=
el XE#4608</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_psr@fbc-pr-primary-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-plane-on=
off@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-1/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-=
lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_vblank@query-idle-hang.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-=
2/igt@kms_vblank@query-idle-hang.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5254">Intel XE#5254</a>) +2 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14225/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
99">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-extende=
d-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-dest=
roy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@xe_eudebug_online@interrupt-all-=
set-breakpoint-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_eudebug_online@pagefault-writ=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@xe_evict@evict-threads-large.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate-race:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_exec_basic@many-execqueues-bi=
ndexecqueue-userptr-invalidate-race.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bind=
execqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-8/igt@xe_exec_multi_queue@many-queues-=
preempt-mode-fault-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-pr=
eempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +22 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-3/igt@xe_exec_system_allocator@many-ex=
ecqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-m=
map-free-nomemset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_exec_system_allocator@many-=
large-execqueues-mmap-free-nomemset.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +513 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-prefetch-madvise:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@xe_exec_system_allocator@once-ma=
lloc-prefetch-madvise.html">WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@xe_exec_system_allocator@process=
-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +19 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_vali=
date_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Int=
el XE#2427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-2/igt@xe_pm@d3cold-i2c.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel=
 XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-1/igt@xe_pm@d3cold-multiple-execs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe=
_engine_class_copy0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@xe_pmu@engine-activity-accur=
acy-90@engine-drm_xe_engine_class_copy0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_pxp@display-pxp-fb.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">=
Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfc=
onfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-4/igt@xe_sriov_scheduling@equal-throug=
hput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-lnl-7/igt@xe_vm@out-of-memory.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745">In=
tel XE#5745</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1422=
5/shard-bmg-7/igt@core_hotunplug@hotrebind.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@fbdev@pan.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/i=
gt@fbdev@pan.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665">Intel XE#4665=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1422=
5/shard-bmg-8/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_cursor_lega=
cy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +2 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bm=
g-4/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14225/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> +5 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3428">Intel XE#3428</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_flip@flip-vs-suspen=
d-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3428">Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_flip@flip-vs-suspend-in=
terruptible@b-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4225/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> +510 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14225/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-=
lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel=
 XE#6693</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14225/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6321">Intel XE#6321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-=
threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebi=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_exec_balancer@=
many-execqueues-cm-virtual-rebind.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/sha=
rd-bmg-7/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_module_load@reload.html">FAIL</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt=
@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_atomic_tran=
sition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14225/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">=
Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Inte=
l XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14225/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0=
-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_bw@connecte=
d-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2=
160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14225/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-1920x10=
80p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
67">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14225/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-3840x2160=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-m=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3432">Intel XE#3432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled=
-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14225/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14225/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2652">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#=
2325</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14225/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4225/shard-bmg-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"=
>Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14225/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1422=
5/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-3/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14225/shard-bmg-2/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_content_protection@type1.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14225/shard-bmg-7/igt@kms_content_protection@type1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_content_protection@uevent.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14225/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14225/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-max-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"=
>Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14225/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320"=
>Intel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14225/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14225/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715=
">Intel XE#6715</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14225/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel X=
E#1508</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14225/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14225/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4422">Intel XE#4422</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-di=
rty-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard=
-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14225/shard-bmg-3/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE=
#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14225/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel =
XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
225/shard-bmg-7/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1422=
5/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-y=
ftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@k=
ms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yt=
ile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_flip_scaled_crc@=
flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#=
2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-in=
dfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_frontbuffer_tra=
cking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1=
9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb=
101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_frontbuffer_tracki=
ng@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_frontbuffer_tracking@=
fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pr=
i-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_frontbuffe=
r_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#63=
14</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-ind=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri=
-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shr=
fb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/235=
2">Intel XE#2352</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14225/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
+16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1422=
5/shard-bmg-5/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4225/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">=
Intel XE#6901</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14225/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14225/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5624">Intel XE#5624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel X=
E#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14225/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4=
596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14225/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale=
-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@kms_plane_scaling@pla=
nes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">=
Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14225/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
38">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Inte=
l XE#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14225/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel X=
E#2391</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14225/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1422=
5/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#=
3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
36">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-e=
xceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_p=
sr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel X=
E#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@kms_psr2_sf=
@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel=
 XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel=
 XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2387">Intel XE#2387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel=
 XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_psr@fbc-pr-primar=
y-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2330">Intel XE#2330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_rotation_crc@prim=
ary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">In=
tel XE#2413</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14225/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">=
Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">In=
tel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14225/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">=
Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14225/shard-bmg-7/igt@kms_sharpness_filter@filter-toggle.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">In=
tel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling=
-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@kms_sharpness_filter@invalid=
-filter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard=
-bmg-8/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14225/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1422=
5/shard-bmg-5/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client-th:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_eudebug@basic-client-th.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
225/shard-bmg-4/igt@xe_eudebug@basic-client-th.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-3/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">I=
ntel XE#4837</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14225/shard-bmg-5/igt@xe_eudebug@basic-vm-access-faultable.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel =
XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6665">Intel XE#6665</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_eudebug_online@interrupt-all.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-1/igt@xe_eudebug_online@pagefault-write-stress.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/666=
5">Intel XE#6665</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6681">Intel XE#6681</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_eudebug_online@pagefault=
-write-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14225/shard-bmg-4/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#483=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665=
">Intel XE#6665</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14225/shard-bmg-8/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#579=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14225/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-use=
rptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_exec_basic@mult=
igpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) =
+7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2322">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-def=
er-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userp=
tr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_exec_multi_queue@=
few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +22 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874=
">Intel XE#6874</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14225/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-priority.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-huge-nome=
mset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5007">Intel XE#5007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_exec_system_allocator@many=
-64k-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-=
nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_exec_system_allocator@=
many-64k-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-2/igt@xe_exec_system_allocator@process-many-mmap-free-=
huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4943">Intel XE#4943</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_exec_system_allocator@proc=
ess-many-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-h=
uge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_exec_system_alloca=
tor@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +21 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8669/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8669/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8669/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_module_load@load.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8669/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-=
6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGT_8669/shard-bmg-6/igt@xe_module_load@load.html">ABO=
RT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard=
-bmg-6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/s=
hard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_866=
9/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_=
8669/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8669/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-8/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8669/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8669/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8669/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#=
2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
887">Intel XE#6887</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14225/shard-bmg-2/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-3/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14225/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14225/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225=
/shard-bmg-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14225/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14225/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard=
-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
225/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14225/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-8/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shar=
d-bmg-5/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard-=
bmg-8/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel X=
E#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14225/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2=
284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14225/shard=
-bmg-2/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4733">Intel XE#4733</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14225/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termin=
ation-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mb=
z.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14225/shard-bmg-4/igt@xe_query@multigpu-query-invalid-=
uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8669/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14225/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8669 -&gt; IGTPW_14225</li>
</ul>
<p>IGTPW_14225: 14225<br />
  IGT_8669: 319db2ffba419f9711acc72895f065a818905efa @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0: 2eb2f8746a879f1c0e4c56b=
715c179424dafd8e0</p>

</body>
</html>

--===============2430515656968508438==--
