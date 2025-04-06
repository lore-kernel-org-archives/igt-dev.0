Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5FAC36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 18:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1700E10E0F1;
	Sun,  6 Apr 2025 18:28:52 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565C710E059;
 Sun,  6 Apr 2025 18:28:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5090523043470642925=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Reduce_scaling_tests_log_s?=
 =?utf-8?q?ize_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 18:28:51 -0000
Message-ID: <174396413132.41104.12668167731438927096@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327205301.3400440-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250327205301.3400440-1-ramanaidu.naladala@intel.com>
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

--===============5090523043470642925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Reduce scaling tests log size (rev2)
URL   : https://patchwork.freedesktop.org/series/146894/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8291_FULL -> XEIGTPW_12870_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12870_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12870_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12870_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-bmg:          NOTRUN -> ([PASS][1], [INCOMPLETE][2])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-4-rc-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-4-rc-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-4-4-rc-ccs-cc-to-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-4-4-rc-ccs-cc-to-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> ([SKIP][5], [SKIP][6]) ([Intel XE#2763]) +9 other tests ( 2 skip )
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-lnl:          [PASS][7] -> ([PASS][8], [INCOMPLETE][9])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  
#### Warnings ####

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     [SKIP][10] ([Intel XE#2763]) -> [SKIP][11] +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12870_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][12] -> ([FAIL][13], [FAIL][14]) ([Intel XE#4665])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@intel_hwmon@hwmon-write.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#3767]) +23 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][16] -> ([FAIL][17], [PASS][18]) ([Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][19] -> [FAIL][20] ([Intel XE#3908]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#316]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][22], [SKIP][23]) ([Intel XE#2327]) +2 other tests ( 2 skip )
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2327]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][25] ([Intel XE#4543]) +2 other tests dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#607])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][28], [SKIP][29]) ([Intel XE#1124]) +5 other tests ( 2 skip )
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> ([SKIP][30], [SKIP][31]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][32] -> [DMESG-FAIL][33] ([Intel XE#4543]) +2 other tests dmesg-fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#1124]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1124]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> ([SKIP][36], [SKIP][37]) ([Intel XE#1124]) +7 other tests ( 2 skip )
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1124]) +6 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [PASS][39] -> [SKIP][40] ([Intel XE#2191])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#2191])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][42], [SKIP][43]) ([Intel XE#2314] / [Intel XE#2894])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][44], [SKIP][45]) ([Intel XE#367]) +1 other test ( 2 skip )
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#367])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> ([SKIP][47], [SKIP][48]) ([Intel XE#1512])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#787]) +159 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#787]) +20 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#2887]) +1 other test ( 2 skip )
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][54], [SKIP][55]) ([Intel XE#455] / [Intel XE#787]) +20 other tests ( 2 skip )
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#2887]) +14 other tests ( 2 skip )
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#3442])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][59] -> ([INCOMPLETE][60], [INCOMPLETE][61]) ([Intel XE#3862])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#3862])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-2.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][64] ([Intel XE#3862])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][65], [SKIP][66]) ([Intel XE#3432])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][67], [SKIP][68]) ([Intel XE#3432])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#2652] / [Intel XE#787]) +7 other tests ( 2 skip )
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][71], [SKIP][72]) ([Intel XE#787]) +78 other tests ( 2 skip )
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2887]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][75] -> ([INCOMPLETE][76], [PASS][77]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2887]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][79] -> [INCOMPLETE][80] ([Intel XE#1727] / [Intel XE#3113])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][81] ([Intel XE#3113])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][82], [SKIP][83]) ([Intel XE#306])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> ([SKIP][84], [SKIP][85]) ([Intel XE#2325]) +1 other test ( 2 skip )
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#306])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_chamelium_color@ctm-max.html
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2325])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2252]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> ([SKIP][89], [SKIP][90]) ([Intel XE#2252]) +9 other tests ( 2 skip )
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#373]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#373]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#373])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#373]) +2 other tests ( 2 skip )
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][96], [FAIL][97]) ([Intel XE#1178])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2390])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][99] ([Intel XE#3304])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][100] ([Intel XE#1178]) +1 other test fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#2321])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2320]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#308])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-bmg:          NOTRUN -> ([SKIP][105], [SKIP][106]) ([Intel XE#2320]) +2 other tests ( 2 skip )
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_cursor_crc@cursor-random-max-size.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> ([SKIP][107], [SKIP][108]) ([Intel XE#1424])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#308])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2321])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][111] -> [SKIP][112] ([Intel XE#2291]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [PASS][113] -> ([PASS][114], [SKIP][115]) ([Intel XE#309]) +3 other tests ( 1 pass, 1 skip )
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          NOTRUN -> ([PASS][116], [SKIP][117]) ([Intel XE#2291])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> ([PASS][118], [SKIP][119]) ([Intel XE#309])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> ([SKIP][120], [SKIP][121]) ([Intel XE#2286])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#309]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][123] -> ([SKIP][124], [PASS][125]) ([Intel XE#2291]) +4 other tests ( 1 pass, 1 skip )
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> ([SKIP][126], [SKIP][127]) ([Intel XE#309])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][128] -> ([FAIL][129], [PASS][130]) ([Intel XE#4667])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#323])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> ([SKIP][132], [SKIP][133]) ([Intel XE#4210])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][134] -> ([SKIP][135], [PASS][136]) ([Intel XE#4302])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][137], [SKIP][138]) ([Intel XE#1340])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][139], [SKIP][140]) ([i915#3804])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#4354])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> ([SKIP][142], [SKIP][143]) ([Intel XE#4354])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#4331])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#4331])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> ([SKIP][146], [SKIP][147]) ([Intel XE#2244])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> ([SKIP][148], [SKIP][149]) ([Intel XE#4156])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#4156])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][151] -> ([SKIP][152], [PASS][153]) ([Intel XE#310]) +10 other tests ( 1 pass, 1 skip )
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-busy-flip:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#310])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][155] -> ([SKIP][156], [SKIP][157]) ([Intel XE#310])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][158], [PASS][159]) ([Intel XE#310]) +1 other test ( 1 pass, 1 skip )
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([PASS][160], [INCOMPLETE][161]) ([Intel XE#2049]) +1 other test ( 1 incomplete, 1 pass )
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [PASS][162] -> ([PASS][163], [FAIL][164]) ([Intel XE#886])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][165] ([Intel XE#886]) +1 other test fail
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][166] -> ([SKIP][167], [SKIP][168]) ([Intel XE#2316]) +1 other test ( 2 skip )
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][169] -> [FAIL][170] ([Intel XE#3321]) +1 other test fail
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][171] -> [FAIL][172] ([Intel XE#301]) +3 other tests fail
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][173] -> ([FAIL][174], [FAIL][175]) ([Intel XE#3321]) +1 other test ( 2 fail )
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][176] -> ([PASS][177], [SKIP][178]) ([Intel XE#2316]) +5 other tests ( 1 pass, 1 skip )
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg2-set2:     [PASS][179] -> [SKIP][180] ([Intel XE#310])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_flip@2x-plain-flip-interruptible.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][181] -> ([FAIL][182], [PASS][183]) ([Intel XE#2882]) +4 other tests ( 1 fail, 1 pass )
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][184] ([Intel XE#301]) +3 other tests fail
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][185] -> ([PASS][186], [FAIL][187]) ([Intel XE#301]) +3 other tests ( 1 fail, 1 pass )
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [PASS][188] -> ([PASS][189], [FAIL][190]) ([Intel XE#3321]) +5 other tests ( 1 fail, 1 pass )
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([PASS][191], [FAIL][192]) ([Intel XE#301])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][193], [FAIL][194]) ([Intel XE#301]) +3 other tests ( 2 fail )
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][195] -> [INCOMPLETE][196] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-adlp:         NOTRUN -> [SKIP][197] ([Intel XE#455]) +9 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2293]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#455]) +7 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][200], [SKIP][201]) ([Intel XE#2293] / [Intel XE#2380]) +2 other tests ( 2 skip )
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][202], [SKIP][203]) ([Intel XE#2293]) +2 other tests ( 2 skip )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][205], [SKIP][206]) ([Intel XE#1401]) +1 other test ( 2 skip )
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][207], [SKIP][208]) ([Intel XE#1401] / [Intel XE#1745]) +1 other test ( 2 skip )
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg2-set2:     [PASS][209] -> ([INCOMPLETE][210], [PASS][211]) ([Intel XE#2049])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_flip_tiling@flip-change-tiling.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][212] -> [FAIL][213] ([Intel XE#1874])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][214] ([Intel XE#656]) +16 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#656]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][216], [SKIP][217]) ([Intel XE#651] / [Intel XE#656]) +1 other test ( 2 skip )
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][218] ([Intel XE#2311]) +12 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][219], [SKIP][220]) ([Intel XE#651]) +8 other tests ( 2 skip )
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [PASS][221] -> ([SKIP][222], [PASS][223]) ([Intel XE#656]) +8 other tests ( 1 pass, 1 skip )
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][224] -> ([SKIP][225], [SKIP][226]) ([Intel XE#656]) +1 other test ( 2 skip )
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][227] -> [SKIP][228] ([Intel XE#656])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][229], [SKIP][230]) ([Intel XE#4141]) +5 other tests ( 2 skip )
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][231], [SKIP][232]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][233] ([Intel XE#4141]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][234] ([Intel XE#651]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][235], [SKIP][236]) ([Intel XE#2311] / [Intel XE#2312]) +1 other test ( 2 skip )
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][237] ([Intel XE#2312]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][238], [SKIP][239]) ([Intel XE#2311]) +16 other tests ( 2 skip )
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][240], [SKIP][241]) ([Intel XE#656])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][242] ([Intel XE#656])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][243] ([Intel XE#651]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][244], [SKIP][245]) ([Intel XE#651]) +1 other test ( 2 skip )
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][246] ([Intel XE#2313]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][247], [SKIP][248]) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][249], [SKIP][250]) ([Intel XE#653] / [Intel XE#656])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> ([SKIP][251], [SKIP][252]) ([Intel XE#2312])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][253], [SKIP][254]) ([Intel XE#2313]) +23 other tests ( 2 skip )
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][255] ([Intel XE#653]) +13 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][256], [SKIP][257]) ([Intel XE#656])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][258] ([Intel XE#653]) +5 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][259], [SKIP][260]) ([Intel XE#653]) +7 other tests ( 2 skip )
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][261], [SKIP][262]) ([Intel XE#2502])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][263] ([Intel XE#1339])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][264] ([Intel XE#2340])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          NOTRUN -> [SKIP][265] ([Intel XE#1503])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][266] -> ([SKIP][267], [PASS][268]) ([Intel XE#1503]) +1 other test ( 1 pass, 1 skip )
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][269] ([Intel XE#2927])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> ([SKIP][270], [SKIP][271]) ([Intel XE#2927])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [PASS][272] -> ([PASS][273], [SKIP][274]) ([Intel XE#4328])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][275] ([Intel XE#2925])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> ([SKIP][276], [SKIP][277]) ([Intel XE#2393])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     [PASS][278] -> ([SKIP][279], [PASS][280]) ([Intel XE#4596])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-none.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][281] -> ([SKIP][282], [PASS][283]) ([Intel XE#4596])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-adlp:         NOTRUN -> [SKIP][284] ([Intel XE#4596]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-bmg:          NOTRUN -> [SKIP][285] ([Intel XE#2493])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> ([SKIP][286], [SKIP][287]) ([Intel XE#2493])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          NOTRUN -> ([SKIP][288], [PASS][289]) ([Intel XE#2685] / [Intel XE#3307])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][290] ([Intel XE#2938])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][291] ([Intel XE#2938])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> ([SKIP][292], [SKIP][293]) ([Intel XE#870]) +1 other test ( 2 skip )
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][294] ([Intel XE#870])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> ([SKIP][295], [SKIP][296]) ([Intel XE#2392])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html
    - shard-adlp:         NOTRUN -> [SKIP][297] ([Intel XE#1129])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][298] -> [SKIP][299] ([Intel XE#836])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][300] -> ([PASS][301], [SKIP][302]) ([Intel XE#836]) +1 other test ( 1 pass, 1 skip )
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_pm_rpm@dpms-non-lpsp.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][303], [SKIP][304]) ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test ( 2 skip )
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][305] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][306] ([Intel XE#1489]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][307], [SKIP][308]) ([Intel XE#1489]) +3 other tests ( 2 skip )
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][309], [SKIP][310]) ([Intel XE#1489]) +2 other tests ( 2 skip )
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][311] ([Intel XE#1489]) +3 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][312] ([Intel XE#1489]) +2 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][313] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][314] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][315] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> ([SKIP][316], [SKIP][317]) ([Intel XE#2234] / [Intel XE#2850]) +7 other tests ( 2 skip )
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_psr@psr2-cursor-plane-move.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][318], [SKIP][319]) ([Intel XE#2850] / [Intel XE#929]) +4 other tests ( 2 skip )
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_psr@psr2-cursor-render.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][320] ([Intel XE#3414])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-bmg:          NOTRUN -> ([SKIP][321], [SKIP][322]) ([Intel XE#3414] / [Intel XE#3904]) +1 other test ( 2 skip )
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][323], [SKIP][324]) ([Intel XE#3414])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][325] ([Intel XE#3414])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][326] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2-set2:     [PASS][327] -> ([SKIP][328], [PASS][329]) ([Intel XE#455])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][330] -> ([FAIL][331], [FAIL][332]) ([Intel XE#771] / [Intel XE#899]) +1 other test ( 2 fail )
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][333], [SKIP][334]) ([Intel XE#455]) +2 other tests ( 2 skip )
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_vrr@flip-dpms.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][335] ([Intel XE#1499])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][336] -> ([FAIL][337], [PASS][338]) ([Intel XE#4227]) +1 other test ( 1 fail, 1 pass )
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-1/igt@kms_vrr@flipline.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-4/igt@kms_vrr@flipline.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-1/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> ([SKIP][339], [SKIP][340]) ([Intel XE#1499])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_vrr@max-min.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][341] ([Intel XE#756])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
    - shard-adlp:         NOTRUN -> [SKIP][342] ([Intel XE#756])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> [ABORT][343] ([Intel XE#2705] / [Intel XE#4540])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][344] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][345] ([Intel XE#1062])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@xe_create@create-big-vram.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][346], [SKIP][347]) ([Intel XE#4497])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@xe_eu_stall@blocking-read.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-bmg:          NOTRUN -> [SKIP][348] ([Intel XE#2905]) +3 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> ([SKIP][349], [SKIP][350]) ([Intel XE#2905]) +5 other tests ( 2 skip )
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][351], [SKIP][352]) ([Intel XE#2905] / [Intel XE#3889])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-bmg:          NOTRUN -> ([SKIP][353], [SKIP][354]) ([Intel XE#2905] / [Intel XE#3889])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][355] ([Intel XE#2905]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][356], [SKIP][357]) ([Intel XE#2905])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_eudebug_online@pagefault-read.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][358], [SKIP][359]) ([Intel XE#4577])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-adlp:         NOTRUN -> [SKIP][360] ([Intel XE#2905]) +3 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         NOTRUN -> [SKIP][361] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][362], [PASS][363]) ([Intel XE#1392]) +2 other tests ( 1 pass, 1 skip )
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][364] -> ([SKIP][365], [PASS][366]) ([Intel XE#1392]) +4 other tests ( 1 pass, 1 skip )
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-adlp:         NOTRUN -> [SKIP][367] ([Intel XE#1392]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> ([SKIP][368], [SKIP][369]) ([Intel XE#2322]) +10 other tests ( 2 skip )
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][370] ([Intel XE#288]) +8 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][371] ([Intel XE#288]) +11 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][372], [SKIP][373]) ([Intel XE#288]) +7 other tests ( 2 skip )
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][374] ([Intel XE#2360])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:
    - shard-adlp:         [PASS][375] -> [DMESG-WARN][376] ([Intel XE#4173])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-1/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-9/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][377], [PASS][378]) ([Intel XE#1999]) +2 other tests ( 1 fail, 1 pass )
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][379] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][380], [SKIP][381]) ([Intel XE#2541] / [Intel XE#3573]) +1 other test ( 2 skip )
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         NOTRUN -> [SKIP][382] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@xe_oa@rc6-disable.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][383], [SKIP][384]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_oa@syncs-syncobj-cfg.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> ([SKIP][385], [SKIP][386]) ([Intel XE#1061])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@xe_peer2peer@read.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][387] ([Intel XE#1173]) +1 other test fail
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][388], [FAIL][389]) ([Intel XE#1173])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][390] ([Intel XE#2284] / [Intel XE#366])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][391] ([Intel XE#1948])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][392], [SKIP][393]) ([Intel XE#2284] / [Intel XE#366])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [PASS][394] -> [DMESG-WARN][395] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          NOTRUN -> ([INCOMPLETE][396], [PASS][397]) ([Intel XE#569])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@xe_pm@s3-mocs.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][398] -> [ABORT][399] ([Intel XE#1794])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-7/igt@xe_pm@s4-basic.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][400] -> ([PASS][401], [ABORT][402]) ([Intel XE#1794])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@xe_pm@s4-basic-exec.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-5/igt@xe_pm@s4-basic-exec.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][403] ([Intel XE#944])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][404], [SKIP][405]) ([Intel XE#944])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> ([SKIP][406], [SKIP][407]) ([Intel XE#944])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> ([SKIP][408], [SKIP][409]) ([Intel XE#944]) +1 other test ( 2 skip )
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][410] ([Intel XE#944])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
    - shard-adlp:         NOTRUN -> [SKIP][411] ([Intel XE#944])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][412] ([Intel XE#4130])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-bmg:          NOTRUN -> ([SKIP][413], [SKIP][414]) ([Intel XE#4130])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          NOTRUN -> ([SKIP][415], [SKIP][416]) ([Intel XE#4273])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [DMESG-WARN][417] ([Intel XE#4173]) -> [PASS][418] +11 other tests pass
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@core_hotunplug@hotreplug.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-6/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][419] ([Intel XE#4543]) -> [PASS][420] +1 other test pass
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-9/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2191]) -> ([PASS][422], [PASS][423])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][424] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#309]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#309]) -> ([PASS][429], [PASS][430]) +1 other test ( 2 pass )
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][431] ([Intel XE#2291]) -> ([PASS][432], [PASS][433]) +1 other test ( 2 pass )
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#4302]) -> ([PASS][435], [PASS][436])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_display_modes@extended-mode-basic.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][437] ([Intel XE#3321]) -> [PASS][438] +1 other test pass
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][439] ([Intel XE#2316]) -> ([PASS][440], [PASS][441]) +1 other test ( 2 pass )
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][442] ([Intel XE#2316]) -> [PASS][443]
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][444] ([Intel XE#886]) -> [PASS][445]
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#310]) -> ([PASS][447], [PASS][448])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][449] ([Intel XE#2049] / [Intel XE#2597]) -> ([PASS][450], [PASS][451]) +3 other tests ( 2 pass )
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][452] ([Intel XE#886]) -> ([PASS][453], [PASS][454]) +2 other tests ( 2 pass )
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][455] ([Intel XE#4543]) -> [PASS][456] +1 other test pass
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][457] ([Intel XE#1874]) -> [PASS][458]
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#656]) -> ([PASS][460], [PASS][461]) +2 other tests ( 2 pass )
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#656]) -> [PASS][463]
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#836]) -> ([PASS][465], [PASS][466])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#1392]) -> [PASS][468] +1 other test pass
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#1392]) -> ([PASS][470], [PASS][471]) +5 other tests ( 2 pass )
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [FAIL][472] ([Intel XE#4541]) -> [PASS][473]
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-1/igt@xe_oa@buffer-size.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-1/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][474] ([Intel XE#1794]) -> [PASS][475] +1 other test pass
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][476] ([Intel XE#1794]) -> ([PASS][477], [PASS][478])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@xe_pm@s4-exec-after.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-8/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][479] ([Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][480] ([Intel XE#4543])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][481] ([Intel XE#4173] / [Intel XE#4543]) -> [DMESG-FAIL][482] ([Intel XE#4543])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][484], [SKIP][485]) ([Intel XE#787]) +6 other tests ( 2 skip )
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#787]) -> [SKIP][487] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][489] ([Intel XE#787]) +3 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#787]) -> ([SKIP][491], [SKIP][492]) ([Intel XE#455] / [Intel XE#787]) +11 other tests ( 2 skip )
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][493] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> ([PASS][494], [INCOMPLETE][495]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][496] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][497] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][498] ([Intel XE#1727] / [Intel XE#3113]) -> ([INCOMPLETE][499], [PASS][500]) ([Intel XE#1727] / [Intel XE#3113])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][501] ([Intel XE#1178]) -> ([SKIP][502], [FAIL][503]) ([Intel XE#1178] / [Intel XE#2341])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][504] ([Intel XE#1178]) -> ([SKIP][505], [FAIL][506]) ([Intel XE#1178] / [Intel XE#455])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_content_protection@lic-type-0.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][507] ([Intel XE#1188]) -> ([SKIP][508], [FAIL][509]) ([Intel XE#1188] / [Intel XE#2341])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_content_protection@uevent.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_content_protection@uevent.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_content_protection@uevent.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#4354]) -> ([PASS][511], [SKIP][512]) ([Intel XE#4354])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-sst.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#310]) -> ([SKIP][514], [PASS][515]) ([Intel XE#310])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][516] ([Intel XE#301] / [Intel XE#3321]) -> ([PASS][517], [FAIL][518]) ([Intel XE#301] / [Intel XE#3321])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][519] ([Intel XE#301]) -> ([FAIL][520], [PASS][521]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][522] ([Intel XE#3321]) -> ([FAIL][523], [PASS][524]) ([Intel XE#3321]) +1 other test ( 1 fail, 1 pass )
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][525] ([Intel XE#4543]) -> [DMESG-FAIL][526] ([Intel XE#324] / [Intel XE#4543]) +3 other tests dmesg-fail
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#656]) -> [SKIP][528] ([Intel XE#651]) +2 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][529] ([Intel XE#2311]) -> ([SKIP][530], [SKIP][531]) ([Intel XE#2311] / [Intel XE#2312]) +15 other tests ( 2 skip )
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][532] ([Intel XE#2311]) -> [SKIP][533] ([Intel XE#2312])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][534] ([Intel XE#2312]) -> ([SKIP][535], [SKIP][536]) ([Intel XE#2311]) +4 other tests ( 2 skip )
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#651]) -> ([SKIP][538], [SKIP][539]) ([Intel XE#651] / [Intel XE#656]) +19 other tests ( 2 skip )
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][540] ([Intel XE#4141]) -> ([SKIP][541], [SKIP][542]) ([Intel XE#2312] / [Intel XE#4141]) +10 other tests ( 2 skip )
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][543] ([Intel XE#2312]) -> ([SKIP][544], [SKIP][545]) ([Intel XE#4141]) +3 other tests ( 2 skip )
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][546] ([Intel XE#4141]) -> [SKIP][547] ([Intel XE#2312]) +1 other test skip
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][548] ([Intel XE#656]) -> ([PASS][549], [SKIP][550]) ([Intel XE#656]) +1 other test ( 1 pass, 1 skip )
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][551] ([Intel XE#2312]) -> [SKIP][552] ([Intel XE#4141])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][553] ([Intel XE#2050]) -> [SKIP][554] ([Intel XE#4141])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#651]) -> ([SKIP][556], [SKIP][557]) ([Intel XE#656])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][558] ([Intel XE#2311]) -> ([SKIP][559], [SKIP][560]) ([Intel XE#2312]) +2 other tests ( 2 skip )
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#651]) -> [SKIP][562] ([Intel XE#656]) +1 other test skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#656]) -> ([SKIP][564], [SKIP][565]) ([Intel XE#651]) +5 other tests ( 2 skip )
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#656]) -> ([SKIP][567], [SKIP][568]) ([Intel XE#651] / [Intel XE#656]) +1 other test ( 2 skip )
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][569] ([Intel XE#2313]) -> ([SKIP][570], [SKIP][571]) ([Intel XE#2312])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][572] ([Intel XE#2312]) -> [SKIP][573] ([Intel XE#2313])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][574] ([Intel XE#2312]) -> ([SKIP][575], [SKIP][576]) ([Intel XE#2313]) +3 other tests ( 2 skip )
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][577] ([Intel XE#2313]) -> [SKIP][578] ([Intel XE#2312])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][579] ([Intel XE#656]) -> ([SKIP][580], [SKIP][581]) ([Intel XE#653] / [Intel XE#656])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][582] ([Intel XE#656]) -> ([SKIP][583], [SKIP][584]) ([Intel XE#653]) +9 other tests ( 2 skip )
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][585] ([Intel XE#2313]) -> ([SKIP][586], [SKIP][587]) ([Intel XE#2312] / [Intel XE#2313]) +17 other tests ( 2 skip )
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#653]) -> [SKIP][589] ([Intel XE#656]) +2 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][590] ([Intel XE#2312]) -> ([SKIP][591], [SKIP][592]) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#653]) -> ([SKIP][594], [SKIP][595]) ([Intel XE#653] / [Intel XE#656]) +21 other tests ( 2 skip )
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#653]) -> ([SKIP][597], [SKIP][598]) ([Intel XE#656]) +1 other test ( 2 skip )
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#455]) -> ([PASS][600], [SKIP][601]) ([Intel XE#455])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][602] ([Intel XE#4596]) -> ([SKIP][603], [SKIP][604]) ([Intel XE#455] / [Intel XE#4596])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][605] ([Intel XE#4540]) -> ([SKIP][606], [ABORT][607]) ([Intel XE#2705] / [Intel XE#4540] / [Intel XE#455])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][608] ([Intel XE#4540]) -> [ABORT][609] ([Intel XE#4502] / [Intel XE#4540])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][610] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][611] ([Intel XE#455]) +1 other test skip
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          [FAIL][612] ([Intel XE#3924]) -> ([FAIL][613], [FAIL][614]) ([Intel XE#3924] / [Intel XE#4568]) +1 other test ( 2 fail )
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-render.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][615] ([Intel XE#1729]) -> ([SKIP][616], [FAIL][617]) ([Intel XE#1729] / [Intel XE#362])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][618] ([Intel XE#2426]) -> ([SKIP][619], [SKIP][620]) ([Intel XE#2509])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][621] ([Intel XE#771]) -> ([FAIL][622], [FAIL][623]) ([Intel XE#771] / [Intel XE#899]) +1 other test ( 2 fail )
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [SKIP][624] ([Intel XE#1392]) -> ([SKIP][625], [PASS][626]) ([Intel XE#1392])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][627] ([Intel XE#1061]) -> ([FAIL][628], [FAIL][629]) ([Intel XE#1173])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_peer2peer@write.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_peer2peer@write.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@xe_peer2peer@write.html

  
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
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
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
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
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
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
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
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8291 -> IGTPW_12870
  * Linux: xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874 -> xe-2867-f823caa91ed490160b8e87792d3bb26ae3e87de0

  IGTPW_12870: 12870
  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874: 274d97eed4e8376b7a66b8904066baed6a1ae874
  xe-2867-f823caa91ed490160b8e87792d3bb26ae3e87de0: f823caa91ed490160b8e87792d3bb26ae3e87de0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/index.html

--===============5090523043470642925==
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
<tr><td><b>Series:</b></td><td>Reduce scaling tests log size (rev2)</td></t=
r>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146894/">https://patchwork.freedesktop.org/series/146894/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12870/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12870/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8291_FULL -&gt; XEIGTPW_12870_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12870_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12870_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
870_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_async_flips@async-flip-with=
-page-flip-events-atomic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_async_flips@async-flip-w=
ith-page-flip-events-atomic.html">INCOMPLETE</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-2-=
4-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_async_flips@async-flip-with-=
page-flip-events-atomic@pipe-b-dp-2-4-rc-ccs.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-4-4-rc-ccs-cc-to-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_flip_tiling@flip-change-ti=
ling@pipe-a-dp-4-4-rc-ccs-cc-to-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_plane_scalin=
g@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard=
-lnl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_pm_rpm@=
modeset-lpsp-stress.html">INCOMPLETE</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b=
:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downsca=
le-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_plane_=
scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> +2=
 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12870_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/=
igt@intel_hwmon@hwmon-write.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@intel_hwmon@hwmon-write.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-=
a-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12870/shard-lnl-3/igt@kms_async_flips@async-flip=
-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-6/igt@kms_async_=
flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel =
XE#911</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-fencing.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12870/shard-adlp-8/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-=
270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12870/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate=
-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-o=
verflow.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12870/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stri=
de-64bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-hflip-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 o=
ther tests dmesg-fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotat=
e-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12870/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-1920=
x1080p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12870/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_bw@connected-linear-tiling-=
3-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_bw@connected-linear-tiling-=
3-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays=
-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12870/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_bw@linear-tiling-4-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays=
-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12870/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-3840x2160=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled=
-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +159 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tile=
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
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tile=
d-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled=
-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12870/shard-lnl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen1=
2-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_ccs@ccs-on-ano=
ther-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) +20 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-til=
ed-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12870/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
7">Intel XE#2887</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-t=
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
/IGTPW_12870/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-c=
cs.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12870/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc=
-ccs.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
@pipe-a-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-til=
ed-dg2-mc-ccs@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-=
tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12870/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-d=
g2-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_ccs@crc-sprite-p=
lanes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_ccs@cr=
c-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) +78 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-4-til=
ed-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#=
3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-c-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12870/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306=
">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_chamelium_color@ctm-green-t=
o-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12870/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325"=
>Intel XE#2325</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_chamelium_color@ctm-max.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-stres=
s-resolution-non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-ch=
ange-during-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-ch=
ange-during-hibernate.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
73">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-storm-=
disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-after-=
hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-wit=
h-enabled-mode.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with-enabl=
ed-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_content_protection@atomic-dpm=
s@pipe-a-dp-4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_content_protection@srm.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen=
-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12870/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256=
x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_cursor_crc@cursor-random-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_cursor_crc@cursor-random-ma=
x-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12870/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
0">Intel XE#2320</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-mov=
ement-128x42.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12870/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-128=
x42.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-mov=
ement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12870/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">=
Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12870/shard-dg2-466/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870=
/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Int=
el XE#309</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_cursor_legacy@2x-long-curso=
r-vs-flip-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-=
flip-legacy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_cursor_legacy@2x-nonblock=
ing-modeset-vs-cursor-atomic.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_cursor_legacy@2x-n=
onblocking-modeset-vs-cursor-atomic.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_cursor_legacy@basic=
-busy-flip-before-cursor-varying-size.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions-varying-size.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_cursor_leg=
acy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-v=
arying-size.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
870/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg=
-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667">Intel XE#4667</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2870/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a>) (<a href=
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
0/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/i=
gt@kms_display_modes@extended-mode-basic.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c@pipe-a-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pi=
pe-a-hdmi-a-3.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2870/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_dp_linktrain_fallback@dsc-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12870/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#=
2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-b=
mg-8/igt@kms_fbcon_fbt@fbc.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
56">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12870/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard=
-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310=
</a>) +10 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_flip@2x-busy-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">=
Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/sh=
ard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms=
_flip@2x-dpms-vs-vblank-race.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-ra=
ce-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race-in=
terruptible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>) +1 other test ( 1 pass, 1 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf=
_vblank@ac-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-w=
f_vblank@ac-dp2-hdmi-a3.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test (=
 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2870/shard-dg2-435/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-d=
g2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-w=
f-vblank@ac-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrup=
tible.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12870/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-i=
nterruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12870/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-=
interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12870/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi=
-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12870/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdm=
i-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12870/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321">Intel XE#3321</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12870/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12870/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2316">Intel XE#2316</a>) +5 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_flip@2x-plain-flip-interruptible.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
0/shard-dg2-464/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#=
310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12870/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
70/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"=
>Intel XE#2882</a>) +4 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12870/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12870/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-edp1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +3 other tests ( 1 fail, 1 pass )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12870/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard=
-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#33=
21</a>) +5 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@flip-vs-expired-vbla=
nk@a-hdmi-a6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi=
-a6.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@flip-vs-expired-vbla=
nk@b-hdmi-a6.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi=
-a6.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) +3 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
870/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049=
">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-=
yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp=
-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-64bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_flip_scaled_crc@=
flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel =
XE#2380</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@k=
ms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2293">Intel XE#2293</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-=
ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-4/igt=
@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-de=
fault-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1401">Intel XE#1401</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-=
yftile-to-32bpp-yftile-upscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_flip_scaled_crc@=
flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel =
XE#1745</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_flip_tiling@flip-change-tiling.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870=
/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling.html">INCOMPLETE</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2=
-432/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-=
a-1-x-to-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12870/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@p=
ipe-b-hdmi-a-1-x-to-x.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel=
 XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rg=
b101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@dr=
rs-rgb101010-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_frontbuffer_tracki=
ng@fbc-2p-primscrn-pri-shrfb-draw-blt.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other =
tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-i=
ndfb-draw-render.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) =
+1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +=
5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_frontbuffer_track=
ing@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE=
#4141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"=
>Intel XE#2312</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) +16 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb101010-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p=
-pri-indfb-multidraw.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-=
pri-indfb-multidraw.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p=
-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +23 other tes=
ts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p=
-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-=
shrfb-scaledprimary.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-sh=
rfb-scaledprimary.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_getfb@getfb-reject-ccs.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1287=
0/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1339">Intel XE#1339</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_getfb@getfb2-accept-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-=
bmg-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_hdr@stati=
c-toggle-suspend.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +1 other test ( 1 pass, 1 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_joiner@basic-ultra-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2870/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-big-joiner.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12870/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-big-joiner.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
70/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328"=
>Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_joiner@invalid-modeset-for=
ce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870=
/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-none.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/=
shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt=
@kms_plane_multiple@2x-tiling-none.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard=
-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_plane_m=
ultiple@2x-tiling-x.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_plane_multiple@2x-tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4596">Intel XE#4596</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
870/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_plane_scaling@intel-max-src=
-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12870/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-size.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685"=
>Intel XE#2685</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_pm_backlight@brightness-wit=
h-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_pm_backlight@brightness-wi=
th-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12870/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#8=
70</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-b=
mg-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Int=
el XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870=
/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#83=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2=
-432/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_pm_rpm@dpms-n=
on-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/836">Intel XE#836</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/s=
hard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a>) (<a href=3D"https://=
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
/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-cursor-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-pla=
ne-update-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12870/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update=
-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1489">Intel XE#1489</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-d=
mg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1489">Intel XE#1489</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_psr@fbc-psr-cursor-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_psr@psr2-cursor-plane-move.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12870/shard-bmg-1/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#22=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_psr@psr2-cursor-render.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
870/shard-dg2-432/igt@kms_psr@psr2-cursor-render.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">=
Intel XE#929</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-form=
at.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3414">Intel XE#3414</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-form=
at.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12870/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel=
 XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3904">Intel XE#3904</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-270.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
870/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2=
-436/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12870/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12870/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/771">Intel XE#771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/899">Intel XE#899</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard=
-dg2-463/igt@kms_vrr@flip-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-1/igt@kms_vrr@flipline.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-4/igt@k=
ms_vrr@flipline.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12870/shard-lnl-1/igt@kms_vrr@flipline.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#=
4227</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_vrr@max-min.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg=
-2/igt@kms_vrr@max-min.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_writeback@writeback-pixel-=
formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/756">Intel XE#756</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_writeback@writeback-pixel-f=
ormats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@testdisplay.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@xe_compute_preempt@compute-thr=
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
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@xe_create@create-big-vram.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@xe_eu_stall@blocking-read.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
70/shard-dg2-432/igt@xe_eu_stall@blocking-read.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@xe_eudebug@basic-vm-access.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12870/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#=
2905</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12870/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-reconn=
ect.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence=
-sigint-client.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12870/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-sigint=
-client.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@xe_eudebug@vm-bind-clear.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_eudebug_online@pagefault-r=
ead.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12870/shard-dg2-432/igt@xe_eudebug_online@pagefault-read.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Int=
el XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_eudebug_online@set-breakpo=
int-sigint-debugger.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@xe_eudebug_online@writes-cachin=
g-vram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@xe_evict@evict-beng-small.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
61">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@xe_exec_bas=
ic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">PASS</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel =
XE#1392</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12870/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bi=
nd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12870/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1392">Intel XE#1392</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bas=
ic-defer-bind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12870/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic-defer=
-bind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2322">Intel XE#2322</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr=
-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@xe_exec_fault_mode@once-bindex=
ecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_exec_fault_mode@once-rebin=
d-prefetch.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12870/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-prefetch.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/288">Intel XE#288</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-=
batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-1/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_p=
arse.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12870/shard-adlp-9/igt@xe_fault_injection@vm-bind-fail-xe_sync_en=
try_parse.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live=
_mocs_kernel_kunit.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mo=
cs_kernel_kunit.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests ( 1 fail, 1 pa=
ss )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-a=
ccess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@xe_oa@non-privileged-access-v=
addr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12870/shard-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">I=
ntel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3573">Intel XE#3573</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@xe_oa@rc6-disable.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Int=
el XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_oa@syncs-syncobj-cfg.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870=
/shard-dg2-432/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel X=
E#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@xe_peer2peer@read.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-l=
nl-7/igt@xe_peer2peer@read.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vr=
am01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@xe_peer2peer@write@write-gpua=
-vram01-gpub-system-p2p.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@xe_pm@d3cold-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948"=
>Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12870/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel X=
E#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shar=
d-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173"=
>Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@xe_pm@s3-mocs.html">INCOMPLETE<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard=
-bmg-2/igt@xe_pm@s3-mocs.html">PASS</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-7/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-2/igt@xe_pm@=
s4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-5/igt@=
xe_pm@s4-basic-exec.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12870/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">I=
ntel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@xe_query@multigpu-query-config=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12870/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cyc=
les.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-lnl-7/igt@xe_query@multigpu-query-invalid=
-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12870/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">=
Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@xe_query@multigpu-query-invalid=
-uc-fw-version-mbz.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12870/shard-bmg-6/igt@xe_query@multigpu-query-invalid-uc=
-fw-version-mbz.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@xe_query@multigpu-query-mem-usa=
ge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclu=
sive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@xe_sriov_auto_provisioning@fair=
-allocation.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12870/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocatio=
n.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2870/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a>) (<a href=
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
PW_12870/shard-adlp-6/igt@core_hotunplug@hotreplug.html">PASS</a> +11 other=
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
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-9/igt@kms_async_flips@=
invalid-async-flip-atomic@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840=
x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@kms_bw@connected-linear-=
tiling-2-displays-3840x2160p.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_bw@connected-linea=
r-tiling-2-displays-3840x2160p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/sha=
rd-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-v=
s-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-varying-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa=
-varying-size.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_cursor_leg=
acy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@=
kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PA=
SS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302=
">Intel XE#4302</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12870/shard-dg2-435/igt@kms_display_modes@extended-mode-basic.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2870/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html">PASS</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12870/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard=
-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a>) +1 other test=
 ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#23=
16</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
870/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_flip@2x-plain-flip-ts-check-in=
terruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-=
modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_flip@2x=
-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-43=
6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.h=
tml">PASS</a>)</li>
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
-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_flip@flip-vs-suspe=
nd-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptib=
le.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">=
Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12870/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870=
/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a>) +2 =
other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-=
a-1-y-to-y.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-4/igt@kms_flip_tiling@=
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
ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-4/igt@kms_flip_tiling@flip-c=
hange-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-spr-indfb-draw-blt.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_frontb=
uffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">PASS</a>) +2 other =
tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-indfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress-n=
o-wait.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12870/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalid=
ate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@xe_exec_basic@multigpu-=
no-exec-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12870/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basi=
c-defer-mmap.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12870/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defe=
r-mmap.html">PASS</a>) +5 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-1/igt@xe_oa@buffer-size.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard=
-lnl-1/igt@xe_oa@buffer-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/s=
hard-adlp-2/igt@xe_pm@s4-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/s=
hard-lnl-7/igt@xe_pm@s4-exec-after.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-8/igt@xe_pm@s4-exec-afte=
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
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-2/igt@kms_async_f=
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
.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp=
-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-c=
c@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms=
_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg=
2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787">Intel XE#787</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/787">Intel XE#787</a>) +2 other tests skip</li>
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt=
@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-=
rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_ccs@cr=
c-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-=
464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-=
6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests ( 2 skip )</li>
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
eedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_ccs=
@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
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
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4345">Intel XE#4345</a>)</li>
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
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_ccs@ran=
dom-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/igt@kms_ccs@ra=
ndom-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12870/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard=
-bmg-8/igt@kms_content_protection@atomic-dpms.html">FAIL</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_content_protection@lic-type-0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12870/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/sha=
rd-dg2-466/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12870/shard-bmg-4/igt@kms_content_protection@uevent.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt=
@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">In=
tel XE#4354</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12870/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-sst.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/sha=
rd-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-int=
erruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12870/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interrupt=
ible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt=
@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shar=
d-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-d=
p4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_flip@2x-fli=
p-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-436/igt@km=
s_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbl=
ank@ab-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12870/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank=
@ab-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test ( 1 fail, 1 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-x=
tile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-adlp-1/igt@kms_flip_s=
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
i.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_=
frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312">Intel XE#2312</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-466/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +19 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-6/igt@kms_frontb=
uffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141=
">Intel XE#4141</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-cur-indfb-onoff.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 oth=
er test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_frontbuffer_tracking=
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
1.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_tracking@fb=
c-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-i=
ndfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-ind=
fb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontb=
uffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) =
+1 other test skip</li>
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
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-432/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/651">Intel XE#651</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-s=
pr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@km=
s_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-7/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-3/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cu=
r-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-463/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/653">Intel XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_=
frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) +17 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sh=
rfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-8/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-bmg-4/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontb=
uffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">In=
tel XE#656</a>) +21 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_frontbuffer=
_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@km=
s_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Int=
el XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/sh=
ard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_hdr@invalid=
-hdr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12870/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-d=
g2-435/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#=
4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540=
">Intel XE#4540</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12870/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
870/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html">ABORT</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Inte=
l XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4540">Intel XE#4540</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hd=
mi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4540">Intel XE#4540</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12870/shard-dg2-464/igt@kms_plane_scaling@intel-=
max-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4502">Intel XE#4502</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downsca=
le-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-435/igt@kms_p=
lane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924">Intel =
XE#3924</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12870/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-render.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-lnl-8=
/igt@kms_psr@fbc-psr2-primary-render.html">FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3924">Intel XE#3924</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Intel XE#4568=
</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12870/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
70/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel =
XE#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12870/shard-bmg-5/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12870/shard-bmg-1/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Inte=
l XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12870/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-l=
nl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#=
899</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Int=
el XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12870/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard=
-dg2-463/igt@xe_exec_basic@multigpu-once-null.html">PASS</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/s=
hard-dg2-464/igt@xe_peer2peer@write.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12870/shard-dg2-433/igt@xe_peer2peer@wr=
ite.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8291 -&gt; IGTPW_12870</li>
<li>Linux: xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874 -&gt; xe-2867-f=
823caa91ed490160b8e87792d3bb26ae3e87de0</li>
</ul>
<p>IGTPW_12870: 12870<br />
  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874: 274d97eed4e8376b7a66b89=
04066baed6a1ae874<br />
  xe-2867-f823caa91ed490160b8e87792d3bb26ae3e87de0: f823caa91ed490160b8e877=
92d3bb26ae3e87de0</p>

</body>
</html>

--===============5090523043470642925==--
