Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A59C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 17:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56F410E2A0;
	Sun,  6 Apr 2025 17:22:04 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1E610E316;
 Sun,  6 Apr 2025 17:22:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4952950240985346376=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Reduce_scaling_tests_log_s?=
 =?utf-8?q?ize?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 17:22:03 -0000
Message-ID: <174396012354.41104.7925065219029804930@e6b6f09ec485>
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

--===============4952950240985346376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Reduce scaling tests log size
URL   : https://patchwork.freedesktop.org/series/146894/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8291_FULL -> XEIGTPW_12862_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12862_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12862_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12862_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> ([SKIP][1], [SKIP][2]) ([Intel XE#2763]) +4 other tests ( 2 skip )
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][3] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [PASS][4] -> ([PASS][5], [INCOMPLETE][6])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  
#### Warnings ####

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          [SKIP][7] ([Intel XE#2763]) -> [SKIP][8] +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#2763]) -> [SKIP][10] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - shard-lnl:          [SKIP][11] ([Intel XE#2763]) -> [SKIP][12] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][13] -> ([PASS][14], [SKIP][15])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12862_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][16] -> ([FAIL][17], [FAIL][18]) ([Intel XE#4665])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#3767]) +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][20] -> [DMESG-WARN][21] ([Intel XE#4543])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2327]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#316]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][24], [SKIP][25]) ([Intel XE#2327])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#1124]) +2 other tests ( 2 skip )
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][28] ([Intel XE#4543]) +2 other tests dmesg-fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][29], [SKIP][30]) ([Intel XE#1124]) +2 other tests ( 2 skip )
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#607])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> ([SKIP][32], [SKIP][33]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1124]) +7 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1124]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1124]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#2191])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#2191])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2314] / [Intel XE#2894])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#367])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#367])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#1512])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][45], [SKIP][46]) ([Intel XE#787]) +81 other tests ( 2 skip )
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#787]) +20 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#2887]) +2 other tests ( 2 skip )
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +33 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2887]) +11 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][54], [SKIP][55]) ([Intel XE#2887]) +4 other tests ( 2 skip )
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#3442])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][57] ([Intel XE#3862]) +1 other test incomplete
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][58] -> ([INCOMPLETE][59], [INCOMPLETE][60]) ([Intel XE#3862])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][61], [INCOMPLETE][62]) ([Intel XE#3862])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#3432])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#3432])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][66], [SKIP][67]) ([Intel XE#2652] / [Intel XE#787]) +3 other tests ( 2 skip )
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][68], [SKIP][69]) ([Intel XE#455] / [Intel XE#787]) +18 other tests ( 2 skip )
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2887])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][71] ([Intel XE#1727] / [Intel XE#3113])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][72] ([Intel XE#3124])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#787]) +155 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][74], [SKIP][75]) ([Intel XE#4417]) +3 other tests ( 2 skip )
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#306])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2325])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#306])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([Intel XE#2325])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2252]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#373]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
    - shard-bmg:          NOTRUN -> ([SKIP][83], [SKIP][84]) ([Intel XE#2252]) +4 other tests ( 2 skip )
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][85], [SKIP][86]) ([Intel XE#373])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#373])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#373]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2390])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][90] ([Intel XE#3304])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][91], [FAIL][92]) ([Intel XE#1178] / [Intel XE#4132])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_content_protection@srm.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][93] ([Intel XE#4132])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][94] ([Intel XE#1178])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2321]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#308])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2320]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1424])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          NOTRUN -> ([SKIP][99], [SKIP][100]) ([Intel XE#2320])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#308])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][102] -> [SKIP][103] ([Intel XE#2291]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2286])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][105] -> ([SKIP][106], [PASS][107]) ([Intel XE#309]) +3 other tests ( 1 pass, 1 skip )
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#309]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][109] -> [SKIP][110] ([Intel XE#309])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][111] -> ([PASS][112], [SKIP][113]) ([Intel XE#2291]) +2 other tests ( 1 pass, 1 skip )
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> ([SKIP][114], [SKIP][115]) ([Intel XE#309])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          NOTRUN -> ([SKIP][116], [PASS][117]) ([Intel XE#2291])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2291])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][119] -> ([PASS][120], [INCOMPLETE][121]) ([Intel XE#3226])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#323])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#4210])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#1340])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][125], [SKIP][126]) ([i915#3804])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][127] -> ([PASS][128], [SKIP][129]) ([Intel XE#3009])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_dp_aux_dev.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_dp_aux_dev.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#4354])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#4354])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> ([SKIP][132], [SKIP][133]) ([Intel XE#4354])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          NOTRUN -> ([PASS][134], [SKIP][135]) ([Intel XE#4294])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> ([SKIP][136], [SKIP][137]) ([Intel XE#4331])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#4331])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2244])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#4156])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][141], [SKIP][142]) ([Intel XE#4156])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][143] -> [SKIP][144] ([Intel XE#2373])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#703])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][146] -> ([PASS][147], [INCOMPLETE][148]) ([Intel XE#2049]) +2 other tests ( 1 incomplete, 1 pass )
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-busy-flip:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#310])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [PASS][150] -> ([PASS][151], [FAIL][152]) ([Intel XE#886])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][153], [PASS][154]) ([Intel XE#886])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a2-dp2.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][155] -> [FAIL][156] ([Intel XE#301]) +5 other tests fail
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [PASS][157] -> [SKIP][158] ([Intel XE#310]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_flip@2x-flip-vs-modeset.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg2-set2:     [PASS][159] -> ([SKIP][160], [SKIP][161]) ([Intel XE#310])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2316]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-dg2-set2:     [PASS][163] -> ([PASS][164], [SKIP][165]) ([Intel XE#310]) +8 other tests ( 1 pass, 1 skip )
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_flip@2x-nonexisting-fb.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          NOTRUN -> ([PASS][166], [SKIP][167]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_flip@2x-plain-flip.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][168] -> [SKIP][169] ([Intel XE#2316]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][170] -> [INCOMPLETE][171] ([Intel XE#2049]) +1 other test incomplete
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a6-dp4.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][172] -> ([PASS][173], [SKIP][174]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [PASS][175] -> ([SKIP][176], [INCOMPLETE][177]) ([Intel XE#2049] / [Intel XE#310])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][178] -> ([INCOMPLETE][179], [PASS][180]) ([Intel XE#2049]) +1 other test ( 1 incomplete, 1 pass )
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][181], [PASS][182]) ([Intel XE#301])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][183] -> ([FAIL][184], [FAIL][185]) ([Intel XE#301]) +1 other test ( 2 fail )
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][186] ([Intel XE#301]) +1 other test fail
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][187] -> ([INCOMPLETE][188], [PASS][189]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([INCOMPLETE][190], [PASS][191]) ([Intel XE#2049] / [Intel XE#2597])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [PASS][192] -> ([FAIL][193], [PASS][194]) ([Intel XE#3149] / [Intel XE#886])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#455]) +9 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#2293]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#455]) +11 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][198], [SKIP][199]) ([Intel XE#2293] / [Intel XE#2380]) +2 other tests ( 2 skip )
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][200], [SKIP][201]) ([Intel XE#2293]) +2 other tests ( 2 skip )
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][203], [SKIP][204]) ([Intel XE#1401]) +1 other test ( 2 skip )
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][205], [SKIP][206]) ([Intel XE#1401] / [Intel XE#1745]) +1 other test ( 2 skip )
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][207] -> [DMESG-FAIL][208] ([Intel XE#4543]) +3 other tests dmesg-fail
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][209] ([Intel XE#656]) +16 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][210], [SKIP][211]) ([Intel XE#651]) +7 other tests ( 2 skip )
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [PASS][212] -> ([PASS][213], [SKIP][214]) ([Intel XE#656]) +7 other tests ( 1 pass, 1 skip )
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][215], [SKIP][216]) ([Intel XE#2312] / [Intel XE#4141])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][217] -> ([SKIP][218], [SKIP][219]) ([Intel XE#656]) +4 other tests ( 2 skip )
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][220], [SKIP][221]) ([Intel XE#4141]) +6 other tests ( 2 skip )
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][222] ([Intel XE#4141]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][223], [SKIP][224]) ([Intel XE#2311]) +11 other tests ( 2 skip )
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#651]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#651]) +14 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][227] ([Intel XE#2311]) +12 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][228], [SKIP][229]) ([Intel XE#2311] / [Intel XE#2312]) +1 other test ( 2 skip )
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][230], [SKIP][231]) ([Intel XE#656]) +1 other test ( 2 skip )
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][232], [SKIP][233]) ([Intel XE#651]) +1 other test ( 2 skip )
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> ([SKIP][234], [SKIP][235]) ([Intel XE#2312]) +1 other test ( 2 skip )
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#656]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][237], [SKIP][238]) ([Intel XE#653] / [Intel XE#656])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][239], [SKIP][240]) ([Intel XE#2312] / [Intel XE#2313]) +5 other tests ( 2 skip )
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][241], [SKIP][242]) ([Intel XE#653]) +6 other tests ( 2 skip )
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#2313]) +13 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][244] ([Intel XE#653]) +13 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][245], [SKIP][246]) ([Intel XE#2313]) +9 other tests ( 2 skip )
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][247] ([Intel XE#2312]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][248] ([Intel XE#653]) +5 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][249] ([Intel XE#2502])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][250] ([Intel XE#1339])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][251] -> ([PASS][252], [SKIP][253]) ([Intel XE#1503])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][254] -> [SKIP][255] ([Intel XE#1503])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][256] -> [SKIP][257] ([Intel XE#3012])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][258] ([Intel XE#2927])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][259] ([Intel XE#2927])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [PASS][260] -> ([SKIP][261], [PASS][262]) ([Intel XE#4328])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][263] ([Intel XE#2925])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-adlp:         NOTRUN -> [SKIP][264] ([Intel XE#4596]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> ([SKIP][265], [SKIP][266]) ([Intel XE#2493])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][267] -> ([PASS][268], [SKIP][269]) ([Intel XE#2571])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> ([SKIP][270], [SKIP][271]) ([Intel XE#870])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][272] ([Intel XE#2938])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][273] ([Intel XE#2938])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][274] ([Intel XE#870]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][275] ([Intel XE#1129])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][276] ([Intel XE#908])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][277] -> ([SKIP][278], [PASS][279]) ([Intel XE#836])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][280], [SKIP][281]) ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test ( 2 skip )
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][282] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][283] ([Intel XE#1489]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][284] ([Intel XE#1489]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][285], [SKIP][286]) ([Intel XE#1489]) +1 other test ( 2 skip )
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][287], [SKIP][288]) ([Intel XE#1489]) +3 other tests ( 2 skip )
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][289] ([Intel XE#1489]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][290] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][291] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][292] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> ([SKIP][293], [SKIP][294]) ([Intel XE#2234] / [Intel XE#2850]) +7 other tests ( 2 skip )
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_psr@psr2-cursor-plane-move.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][295], [SKIP][296]) ([Intel XE#2850] / [Intel XE#929]) +2 other tests ( 2 skip )
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_psr@psr2-cursor-render.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][297] ([Intel XE#3414])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-bmg:          NOTRUN -> [SKIP][298] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][299] ([Intel XE#3414]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][300] -> ([PASS][301], [SKIP][302]) ([Intel XE#1435]) +1 other test ( 1 pass, 1 skip )
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          NOTRUN -> ([SKIP][303], [SKIP][304]) ([Intel XE#1435])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][305] -> [FAIL][306] ([Intel XE#899])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          [PASS][307] -> ([PASS][308], [ABORT][309]) ([Intel XE#2625])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:
    - shard-bmg:          [PASS][310] -> ([PASS][311], [FAIL][312]) ([Intel XE#4075])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([PASS][313], [ABORT][314]) ([Intel XE#2625])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [PASS][315] -> [DMESG-WARN][316] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][317], [SKIP][318]) ([Intel XE#455]) +2 other tests ( 2 skip )
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_vrr@flip-dpms.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][319] ([Intel XE#1499])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> ([SKIP][320], [SKIP][321]) ([Intel XE#1499])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_vrr@max-min.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][322] -> [SKIP][323] ([Intel XE#1499])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_vrr@negative-basic.html
    - shard-dg2-set2:     [PASS][324] -> ([SKIP][325], [PASS][326]) ([Intel XE#455])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_vrr@negative-basic.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_vrr@negative-basic.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][327] ([Intel XE#756])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html
    - shard-adlp:         NOTRUN -> [SKIP][328] ([Intel XE#756])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> [ABORT][329] ([Intel XE#2705] / [Intel XE#4540])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [PASS][330] -> ([PASS][331], [FAIL][332]) ([Intel XE#4278]) +1 other test ( 1 fail, 1 pass )
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][333] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][334] ([Intel XE#1062])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_create@create-big-vram.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][335], [SKIP][336]) ([Intel XE#4497])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_eu_stall@blocking-read.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-bmg:          NOTRUN -> ([SKIP][337], [SKIP][338]) ([Intel XE#2905]) +5 other tests ( 2 skip )
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@xe_eudebug@attach-debug-metadata.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][339] ([Intel XE#2905]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-bmg:          NOTRUN -> [SKIP][340] ([Intel XE#2905] / [Intel XE#3889])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][341] ([Intel XE#2905] / [Intel XE#3889])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-bmg:          NOTRUN -> ([SKIP][342], [SKIP][343]) ([Intel XE#2905] / [Intel XE#3889])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][344], [SKIP][345]) ([Intel XE#2905])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@xe_eudebug_online@pagefault-read.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][346] ([Intel XE#2905]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][347], [SKIP][348]) ([Intel XE#4577])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-adlp:         NOTRUN -> [SKIP][349] ([Intel XE#2905]) +3 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         NOTRUN -> [SKIP][350] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][351] ([Intel XE#1392]) +2 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][352] -> ([SKIP][353], [PASS][354]) ([Intel XE#1392]) +6 other tests ( 1 pass, 1 skip )
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][355], [SKIP][356]) ([Intel XE#2322]) +2 other tests ( 2 skip )
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-dg2-set2:     [PASS][357] -> [SKIP][358] ([Intel XE#1392])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> ([PASS][359], [SKIP][360]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-adlp:         NOTRUN -> [SKIP][361] ([Intel XE#1392]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][362] ([Intel XE#2322]) +7 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-dg2-set2:     [PASS][363] -> ([SKIP][364], [SKIP][365]) ([Intel XE#1392])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][366], [SKIP][367]) ([Intel XE#288]) +8 other tests ( 2 skip )
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][368] ([Intel XE#288]) +8 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][369] ([Intel XE#288]) +10 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][370] ([Intel XE#2360])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][371] -> ([PASS][372], [DMESG-WARN][373]) ([Intel XE#3876])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [PASS][374] -> [DMESG-WARN][375] ([Intel XE#4173]) +3 other tests dmesg-warn
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> ([PASS][376], [FAIL][377]) ([Intel XE#1999]) +2 other tests ( 1 fail, 1 pass )
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][378] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][379], [SKIP][380]) ([Intel XE#2541] / [Intel XE#3573]) +1 other test ( 2 skip )
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         NOTRUN -> [SKIP][381] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_oa@rc6-disable.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][382], [SKIP][383]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@xe_oa@syncs-syncobj-cfg.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> ([SKIP][384], [SKIP][385]) ([Intel XE#1061])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@xe_peer2peer@read.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-4/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][386] ([Intel XE#1173]) +2 other tests fail
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-lnl:          [PASS][387] -> ([INCOMPLETE][388], [PASS][389]) ([Intel XE#4423])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-6/igt@xe_pm@d3hot-mmap-system.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@xe_pm@d3hot-mmap-system.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-3/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][390] ([Intel XE#1948])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][391] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][392] -> [ABORT][393] ([Intel XE#1794])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][394] -> [ABORT][395] ([Intel XE#1794])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][396] -> ([PASS][397], [ABORT][398]) ([Intel XE#1794]) +1 other test ( 1 abort, 1 pass )
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][399] ([Intel XE#944])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> ([SKIP][400], [SKIP][401]) ([Intel XE#944])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@xe_query@multigpu-query-hwconfig.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][402], [SKIP][403]) ([Intel XE#944])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> ([SKIP][404], [SKIP][405]) ([Intel XE#944])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@xe_query@multigpu-query-invalid-size.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][406] ([Intel XE#944])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-adlp:         NOTRUN -> [SKIP][407] ([Intel XE#944])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][408] ([Intel XE#4130]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          NOTRUN -> ([SKIP][409], [SKIP][410]) ([Intel XE#4273])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [DMESG-WARN][411] ([Intel XE#4173]) -> [PASS][412] +11 other tests pass
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@core_hotunplug@hotreplug.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-6/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][413] ([Intel XE#4543]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][415] ([Intel XE#3908]) -> [PASS][416] +1 other test pass
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2191]) -> ([PASS][418], [PASS][419])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][420] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> ([PASS][421], [PASS][422]) +1 other test ( 2 pass )
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][423] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][424]
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][425] ([Intel XE#1727] / [Intel XE#3113]) -> ([PASS][426], [PASS][427])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][428] ([Intel XE#2291]) -> [PASS][429]
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#309]) -> ([PASS][431], [PASS][432])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#309]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][435] ([Intel XE#2291]) -> ([PASS][436], [PASS][437])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#4302]) -> [PASS][439]
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#4354]) -> [PASS][441]
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][442] ([Intel XE#3321]) -> [PASS][443] +1 other test pass
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][444] ([Intel XE#301]) -> ([PASS][445], [PASS][446]) +2 other tests ( 2 pass )
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][447] ([Intel XE#2316]) -> ([PASS][448], [PASS][449]) +2 other tests ( 2 pass )
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][450] ([Intel XE#886]) -> ([PASS][451], [PASS][452])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#310]) -> ([PASS][454], [PASS][455])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][456] ([Intel XE#2049] / [Intel XE#2597]) -> ([PASS][457], [PASS][458]) +2 other tests ( 2 pass )
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][459] ([Intel XE#4543]) -> [PASS][460]
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][461] ([Intel XE#1874]) -> [PASS][462]
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#656]) -> ([PASS][464], [PASS][465]) +5 other tests ( 2 pass )
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][466] ([Intel XE#4212]) -> [PASS][467]
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][468] ([Intel XE#4540]) -> [PASS][469] +1 other test pass
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][470] ([Intel XE#718]) -> [PASS][471]
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#836]) -> ([PASS][473], [PASS][474])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][475] ([Intel XE#771]) -> [PASS][476]
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#1392]) -> [PASS][478]
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1392]) -> ([PASS][480], [PASS][481]) +7 other tests ( 2 pass )
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [FAIL][482] ([Intel XE#4541]) -> ([PASS][483], [PASS][484])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-1/igt@xe_oa@buffer-size.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-4/igt@xe_oa@buffer-size.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][485] ([Intel XE#1794]) -> [PASS][486] +1 other test pass
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][487] ([Intel XE#1794]) -> ([PASS][488], [PASS][489])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-7/igt@xe_pm@s4-exec-after.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][490] ([Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][491] ([Intel XE#4543])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][492] ([Intel XE#4173] / [Intel XE#4543]) -> [DMESG-FAIL][493] ([Intel XE#4543])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#787]) -> ([SKIP][495], [SKIP][496]) ([Intel XE#455] / [Intel XE#787]) +10 other tests ( 2 skip )
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#787]) -> [SKIP][498] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][500] ([Intel XE#787]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][501] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][502], [INCOMPLETE][503]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][504] ([Intel XE#3124]) -> ([DMESG-WARN][505], [PASS][506]) ([Intel XE#1727] / [Intel XE#3113])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][508], [SKIP][509]) ([Intel XE#787]) +6 other tests ( 2 skip )
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][510] ([Intel XE#1178]) -> [SKIP][511] ([Intel XE#2341])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][512] ([Intel XE#1178]) -> ([FAIL][513], [SKIP][514]) ([Intel XE#1178] / [Intel XE#2341])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_content_protection@legacy.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_content_protection@legacy.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][515] ([Intel XE#1178]) -> ([FAIL][516], [SKIP][517]) ([Intel XE#1178] / [Intel XE#455]) +1 other test ( 1 fail, 1 skip )
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_content_protection@lic-type-0.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][518] ([Intel XE#1178]) -> ([INCOMPLETE][519], [FAIL][520]) ([Intel XE#1178] / [Intel XE#4132]) +1 other test ( 1 fail, 1 incomplete )
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-2/igt@kms_content_protection@srm.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_content_protection@srm.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][521] ([Intel XE#1188]) -> ([FAIL][522], [SKIP][523]) ([Intel XE#1188] / [Intel XE#455])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_content_protection@uevent.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_content_protection@uevent.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_content_protection@uevent.html
    - shard-bmg:          [FAIL][524] ([Intel XE#1188]) -> ([SKIP][525], [FAIL][526]) ([Intel XE#1188] / [Intel XE#2341])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_content_protection@uevent.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_content_protection@uevent.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#309]) -> ([SKIP][528], [PASS][529]) ([Intel XE#309])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2-set2:     [INCOMPLETE][530] ([Intel XE#3226]) -> [SKIP][531] ([Intel XE#309])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#310]) -> ([SKIP][533], [PASS][534]) ([Intel XE#310])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][535] ([Intel XE#3321]) -> [SKIP][536] ([Intel XE#2316])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][537] ([Intel XE#3321]) -> ([PASS][538], [SKIP][539]) ([Intel XE#2316])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][540] ([Intel XE#301]) -> ([FAIL][541], [PASS][542]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][543] ([Intel XE#301] / [Intel XE#3321]) -> ([FAIL][544], [PASS][545]) ([Intel XE#301] / [Intel XE#3321])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][546] ([Intel XE#301]) -> ([PASS][547], [FAIL][548]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][549] ([Intel XE#301] / [Intel XE#3149]) -> ([PASS][550], [FAIL][551]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 1 fail, 1 pass )
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][552] ([Intel XE#2049] / [Intel XE#2597]) -> ([INCOMPLETE][553], [PASS][554]) ([Intel XE#2049] / [Intel XE#2597])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-lnl:          [FAIL][555] ([Intel XE#886]) -> ([FAIL][556], [PASS][557]) ([Intel XE#3149] / [Intel XE#886])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][558] ([Intel XE#886]) -> ([FAIL][559], [PASS][560]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][561] ([Intel XE#4543]) -> [DMESG-FAIL][562] ([Intel XE#324] / [Intel XE#4543]) +3 other tests dmesg-fail
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#656]) -> ([SKIP][564], [SKIP][565]) ([Intel XE#651]) +7 other tests ( 2 skip )
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][566] ([Intel XE#2311]) -> [SKIP][567] ([Intel XE#2312]) +5 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][568] ([Intel XE#2312]) -> ([SKIP][569], [SKIP][570]) ([Intel XE#2311]) +1 other test ( 2 skip )
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][571] ([Intel XE#2312]) -> [SKIP][572] ([Intel XE#2311]) +2 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][573] ([Intel XE#2311]) -> ([SKIP][574], [SKIP][575]) ([Intel XE#2311] / [Intel XE#2312]) +8 other tests ( 2 skip )
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][576] ([Intel XE#4141]) -> [SKIP][577] ([Intel XE#2312]) +2 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][578] ([Intel XE#4141]) -> ([SKIP][579], [SKIP][580]) ([Intel XE#2312] / [Intel XE#4141]) +4 other tests ( 2 skip )
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][581] ([Intel XE#2312]) -> [SKIP][582] ([Intel XE#4141]) +2 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][583] ([Intel XE#2312]) -> ([SKIP][584], [SKIP][585]) ([Intel XE#4141])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][586] ([Intel XE#4141]) -> ([SKIP][587], [SKIP][588]) ([Intel XE#2312])
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][589] ([Intel XE#2050]) -> ([SKIP][590], [SKIP][591]) ([Intel XE#4141])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][592] ([Intel XE#2311]) -> ([SKIP][593], [SKIP][594]) ([Intel XE#2312]) +3 other tests ( 2 skip )
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][595] ([Intel XE#651]) -> ([SKIP][596], [SKIP][597]) ([Intel XE#656]) +1 other test ( 2 skip )
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][598] ([Intel XE#651]) -> ([SKIP][599], [SKIP][600]) ([Intel XE#651] / [Intel XE#656]) +12 other tests ( 2 skip )
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#656]) -> [SKIP][602] ([Intel XE#651]) +2 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#651]) -> [SKIP][604] ([Intel XE#656]) +5 other tests skip
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][605] ([Intel XE#2313]) -> [SKIP][606] ([Intel XE#2312]) +4 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#653]) -> ([SKIP][608], [SKIP][609]) ([Intel XE#656]) +1 other test ( 2 skip )
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][610] ([Intel XE#2313]) -> ([SKIP][611], [SKIP][612]) ([Intel XE#2312])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#656]) -> ([SKIP][614], [SKIP][615]) ([Intel XE#653]) +6 other tests ( 2 skip )
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][616] ([Intel XE#2313]) -> ([SKIP][617], [SKIP][618]) ([Intel XE#2312] / [Intel XE#2313]) +10 other tests ( 2 skip )
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][619] ([Intel XE#2312]) -> ([SKIP][620], [SKIP][621]) ([Intel XE#2313]) +4 other tests ( 2 skip )
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][622] ([Intel XE#653]) -> [SKIP][623] ([Intel XE#656]) +4 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][624] ([Intel XE#653]) -> ([SKIP][625], [SKIP][626]) ([Intel XE#653] / [Intel XE#656]) +14 other tests ( 2 skip )
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][627] ([Intel XE#656]) -> ([SKIP][628], [SKIP][629]) ([Intel XE#653] / [Intel XE#656]) +1 other test ( 2 skip )
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][630] ([Intel XE#656]) -> [SKIP][631] ([Intel XE#653]) +1 other test skip
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][632] ([Intel XE#2312]) -> [SKIP][633] ([Intel XE#2313])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][634] ([Intel XE#2312]) -> ([SKIP][635], [SKIP][636]) ([Intel XE#2312] / [Intel XE#2313])
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][637] ([Intel XE#455]) -> ([SKIP][638], [PASS][639]) ([Intel XE#455])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][640] ([Intel XE#2493]) -> ([SKIP][641], [SKIP][642]) ([Intel XE#2493] / [Intel XE#4596])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#4596]) -> [SKIP][644] ([Intel XE#455])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][645] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][646] ([Intel XE#455]) +1 other test skip
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][647] ([Intel XE#718]) -> ([FAIL][648], [PASS][649]) ([Intel XE#718])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          [FAIL][650] ([Intel XE#3924]) -> ([FAIL][651], [FAIL][652]) ([Intel XE#3924] / [Intel XE#4568]) +1 other test ( 2 fail )
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][653] ([Intel XE#2426]) -> ([SKIP][654], [FAIL][655]) ([Intel XE#1729] / [Intel XE#2426])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [FAIL][656] ([Intel XE#1729]) -> ([SKIP][657], [FAIL][658]) ([Intel XE#1729] / [Intel XE#362])
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][659] ([Intel XE#2426]) -> ([SKIP][660], [SKIP][661]) ([Intel XE#2426] / [Intel XE#2509])
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][662] ([Intel XE#771]) -> [FAIL][663] ([Intel XE#899])
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][664] ([Intel XE#1061]) -> [FAIL][665] ([Intel XE#1173])
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_peer2peer@write.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@xe_peer2peer@write.html

  
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
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
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
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924
  [Intel XE#4075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4075
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4423
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568
  [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8291 -> IGTPW_12862
  * Linux: xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874 -> xe-2866-12422ea031abd6ad50e63c8d3b655315ca2fccaa

  IGTPW_12862: 12862
  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874: 274d97eed4e8376b7a66b8904066baed6a1ae874
  xe-2866-12422ea031abd6ad50e63c8d3b655315ca2fccaa: 12422ea031abd6ad50e63c8d3b655315ca2fccaa

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/index.html

--===============4952950240985346376==
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
<tr><td><b>Series:</b></td><td>Reduce scaling tests log size</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146894/">https://patchwork.freedesktop.org/series/146894/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12862/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12862/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8291_FULL -&gt; XEIGTPW_12862_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12862_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12862_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
862_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_plane_scalin=
g@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862=
/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt=
@kms_pm_rpm@modeset-stress-extra-wait.html">INCOMPLETE</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale=
-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_plane_scal=
ing@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> +4 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downsca=
le-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_plane_=
scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-a:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-4/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html">SKI=
P</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">SKIP</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12862/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip=
-overlay.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12862/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12862_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/=
igt@intel_hwmon@hwmon-write.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@intel_hwmon@hwmon-write.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-=
4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-=
b-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12862/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-a=
tomic@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-=
270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12862/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rota=
te-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12862/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate=
-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate=
-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12862/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stri=
de-64bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160=
x1440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12862/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_bw@linear-tiling-4-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays=
-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12862/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-3840x2160=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-t=
iled-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +81 other tests ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tile=
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
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tile=
d-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled=
-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen1=
2-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-ti=
led-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +33 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-tile=
d-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-18=
0-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_ccs@crc-primary-rotatio=
n-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests =
( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-c-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12862/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-c=
cs.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12862/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc=
-ccs.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_ccs@crc-pri=
mary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-d=
g2-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_ccs@crc-sprite-p=
lanes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_ccs@missing-ccs-bu=
ffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +18 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tile=
d-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +155 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_cdclk@mode-transition@pip=
e-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12862/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4417">Intel XE#4417</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-t=
o-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_chamelium_color@ctm-green-to=
-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_chamelium_color@ctm-max.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_chamelium_color@ctm-negativ=
e.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12862/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel X=
E#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-storm-=
disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm-=
disable.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12862/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
252">Intel XE#2252</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-fa=
st.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12862/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel =
XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-after-=
hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-with=
-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_content_protection@srm.ht=
ml">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12862/shard-dg2-466/igt@kms_content_protection@srm.html">FAIL</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#=
1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
132">Intel XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_content_protection@srm@pip=
e-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4132">Intel XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_content_protection@srm@pip=
e-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_cursor_crc@cursor-random-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_cursor_crc@cursor-random-max=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-move=
ment-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-mov=
ement-256x85.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12862/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-256=
x85.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-mov=
ement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12862/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tran=
sitions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_cursor_legacy@cursor=
a-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel =
XE#309</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tran=
sitions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_cursor_legacy@cursorb=
-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12862/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard=
-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12862/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-v=
arying-size.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-fl=
ipb-toggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12862/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-=
cursor-atomic-transitions-varying-size.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_cursor_l=
egacy@flip-vs-cursor-atomic-transitions-varying-size.html">INCOMPLETE</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel=
 XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_dp_aux_dev.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt=
@kms_dp_aux_dev.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#=
3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4354">Intel XE#4354</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2862/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fa=
llback.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12862/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/429=
4">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc-f=
allback.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12862/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
331">Intel XE#4331</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_dp_linktrain_fallback@dsc-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Inte=
l XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862=
/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shar=
d-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_feature_discovery@display-=
3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12862/shard-dg2-435/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard=
-dg2-466/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">INCOMPLETE</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel=
 XE#2049</a>) +2 other tests ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_flip@2x-busy-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">=
Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2862/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-d=
g2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-=
wf-vblank@ab-hdmi-a2-dp2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocki=
ng-wf-vblank@ab-hdmi-a2-dp2.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12862/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi=
-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-d=
g2-464/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2862/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-d=
g2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-d=
g2-436/igt@kms_flip@2x-nonexisting-fb.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_flip@2x-n=
onexisting-fb.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/310">Intel XE#310</a>) +8 other tests ( 1 pass, 1 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_flip@2x-plain-flip.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/sh=
ard-bmg-4/igt@kms_flip@2x-plain-flip.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other=
 test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12862/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a6-=
dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12862/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi=
-a6-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12862/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
62/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12862/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2862/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">I=
NCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-=
dp2-hdmi-a3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-inte=
rruptible@ad-dp2-hdmi-a3.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_flip@2x-wf_vblank-=
ts-check-interruptible@ad-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 othe=
r test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_flip@flip-vs-expired-vbla=
nk.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12862/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel =
XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12862/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12862/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-edp1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblan=
k@c-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2862/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPL=
ETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/s=
hard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE=
#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2597">Intel XE#2597</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_flip@flip-vs-suspend@d-hdmi=
-a3.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/204=
9">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
62/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-6=
/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel X=
E#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-=
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
/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
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
/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp=
-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-64bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_flip_scaled_crc@=
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
g/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@k=
ms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2293">Intel XE#2293</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
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
g/tree/intel-xe/IGTPW_12862/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-=
ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt=
@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-de=
fault-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1401">Intel XE#1401</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-=
yftile-to-32bpp-yftile-upscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_flip_scaled_crc@=
flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel =
XE#1745</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-=
a-1-y-to-y.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12862/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@p=
ipe-b-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dme=
sg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)=
 +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-pri-shrfb-draw-blt.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@fbc-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other =
tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel =
XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb=
-plflip-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests =
( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +=
6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-1/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 =
other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb101010-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-primscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@=
fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other te=
st ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcps=
r-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">In=
tel XE#2313</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653<=
/a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p=
-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@=
kms_hdr@invalid-hdr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-b=
mg-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/sha=
rd-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_joiner@basic-ultra-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-big-joiner.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12862/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
62/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328"=
>Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_joiner@invalid-modeset-for=
ce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_plane_multiple@2x-tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4596">Intel XE#4596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
862/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
62/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4=
/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_pm_backlight@bad-brightness=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12862/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#8=
70</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_pm_backlight@brightness-wit=
h-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_pm_backlight@brightness-wi=
th-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Int=
el XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">I=
ntel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2=
-464/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_pm_rpm@dpms-n=
on-lpsp.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/s=
hard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a>) (<a href=3D"https://=
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
/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress.h=
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
/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-cursor-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-d=
mg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1489">Intel XE#1489</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_psr2_sf@psr2-over=
lay-plane-move-continuous-exceed-fully-sf.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_psr@fbc-psr-cursor-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_psr@psr-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">In=
tel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_psr@psr2-cursor-plane-move.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12862/shard-bmg-7/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#22=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_psr@psr2-cursor-render.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
862/shard-dg2-432/igt@kms_psr@psr2-cursor-render.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">=
Intel XE#929</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-form=
at.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3414">Intel XE#3414</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/sha=
rd-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_set=
mode@clone-exclusive-crtc.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test ( 1 p=
ass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_setmode@invalid-clone-singl=
e-crtc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12862/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/143=
5">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12862/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
862/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg=
-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">ABORT</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-d=
p-2.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12862/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend@pip=
e-d-dp-2.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12862/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe=
-d-dp-2.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4075">Intel XE#4075</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms=
-suspend@pipe-d-hdmi-a-3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_vblank@ts-continuation-d=
pms-suspend@pipe-d-hdmi-a-3.html">ABORT</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/s=
hard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE=
#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4173">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard=
-dg2-435/igt@kms_vrr@flip-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg=
-6/igt@kms_vrr@max-min.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/ig=
t@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-4=
64/igt@kms_vrr@negative-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_vrr@negative-basi=
c.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_writeback@writeback-pixel-=
formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/756">Intel XE#756</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_writeback@writeback-pixel-f=
ormats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@testdisplay.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
862/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg=
-6/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>=
) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@xe_compute_preempt@compute-thr=
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
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_create@create-big-vram.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_eu_stall@blocking-read.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
62/shard-dg2-432/igt@xe_eu_stall@blocking-read.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@xe_eudebug@attach-debug-metadat=
a.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12862/shard-bmg-4/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel X=
E#2905</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufenc=
e-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence=
-sigint-client.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12862/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint=
-client.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@xe_eudebug_online@pagefault-r=
ead.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12862/shard-dg2-432/igt@xe_eudebug_online@pagefault-read.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Int=
el XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_eudebug_online@resume-dss.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@xe_eudebug_online@set-breakpo=
int-sigint-debugger.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_eudebug_online@writes-cachin=
g-vram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_evict@evict-beng-small.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
61">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_exec_basic@m=
ultigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg=
2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-user=
ptr-rebind.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1392">Intel XE#1392</a>) +6 other tests ( 1 pass, 1 skip )<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_exec_basic@multigpu-man=
y-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-rebind.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_exec_basic@multig=
pu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 ot=
her test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basi=
c-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null-defer-mmap.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12862/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
62/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"=
>Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_exec_fault_mode@many-execq=
ueues-basic-imm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12862/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-=
basic-imm.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/288">Intel XE#288</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr=
-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind=
-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-=
batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12862/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-rebi=
nd.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12862/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.h=
tml">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-=
xe_wopcm_init.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12862/shard-adlp-6/igt@xe_fault_injection@inject-fault-p=
robe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 other tes=
ts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live=
_mocs_kernel_kunit.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12862/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mo=
cs_kernel_kunit.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests ( 1 fail, 1 pa=
ss )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-a=
ccess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-432/igt@xe_oa@non-privileged-access-v=
addr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12862/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">I=
ntel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3573">Intel XE#3573</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_oa@rc6-disable.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Int=
el XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@xe_oa@syncs-syncobj-cfg.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862=
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
g/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@xe_peer2peer@read.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-l=
nl-4/igt@xe_peer2peer@read.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vr=
am01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-6/igt@xe_pm@d3hot-mmap-system.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/=
igt@xe_pm@d3hot-mmap-system.html">INCOMPLETE</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-3/igt@xe_pm@d3hot-mmap-sy=
stem.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4423">Intel XE#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948"=
>Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-2=
/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp=
-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-4=
/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-2/igt@xe_pm@s4-vm-bind-userpt=
r.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1794">Intel XE#1794</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@xe_query@multigpu-query-config=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@xe_query@multigpu-query-hwconfi=
g.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12862/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE=
#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12862/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cyc=
les.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@xe_query@multigpu-query-invalid=
-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12862/shard-lnl-8/igt@xe_query@multigpu-query-invalid-size.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">=
Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@xe_query@multigpu-query-invalid-=
uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@xe_query@multigpu-query-mem-usa=
ge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclu=
sive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2862/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a>) (<a href=
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
PW_12862/shard-adlp-6/igt@core_hotunplug@hotreplug.html">PASS</a> +11 other=
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
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-8/igt@kms_async_flips@=
invalid-async-flip-atomic@pipe-c-hdmi-a-1.html">PASS</a></li>
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
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-9/igt@kms_atomic_tr=
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
01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_bw@connected-linear-=
tiling-2-displays-3840x2160p.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_bw@connected-linea=
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
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/sh=
ard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12862/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-h=
dmi-a-6.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-b-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">=
PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs=
-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_cursor_legacy@2=
x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12862/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-le=
gacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12862/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html=
">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-varying-size.html">PASS</a></li>
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
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_cursor_leg=
acy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@=
kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PA=
SS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302=
">Intel XE#4302</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12862/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">In=
tel XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12862/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_flip@2x-fli=
p-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@km=
s_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a=
>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#23=
16</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2862/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_f=
lip@2x-nonexisting-fb.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/886">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12862/shard-dg2-435/igt@kms_flip@2x-plain-flip-ts-check-interr=
uptible.html">PASS</a>)</li>
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
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_flip@2x=
-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-46=
3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.h=
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
-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_flip@flip-vs-suspe=
nd-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptib=
le.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-=
a-1-y-to-y.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-9/igt@kms_flip_tiling@=
flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-=
a-1-y-to-x.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-9/igt@kms_flip_tiling@flip-c=
hange-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-cur-indfb-onoff.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">PASS</a>) +5 other tests ( 2=
 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp=
-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4212">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_plane_scaling@intel=
-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hd=
mi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4540">Intel XE#4540</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12862/shard-dg2-436/igt@kms_plane_scaling@intel-=
max-src-size@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard=
-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress-n=
o-wait.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12862/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12862/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@xe_exec_ba=
sic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12862/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basi=
c-defer-mmap.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12862/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defe=
r-mmap.html">PASS</a>) +7 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-1/igt@xe_oa@buffer-size.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shar=
d-lnl-4/igt@xe_oa@buffer-size.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@xe_oa@buffer-size.html"=
>PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/s=
hard-adlp-1/igt@xe_pm@s4-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/s=
hard-lnl-7/igt@xe_pm@s4-exec-after.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-8/igt@xe_pm@s4-exec-afte=
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
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-4/igt@kms_async_f=
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
.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp=
-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe=
-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_ccs@bad-aux-strid=
e-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_ccs@bad-au=
x-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hd=
mi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-=
tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other t=
est skip</li>
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt=
@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) +1 other test skip</li>
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_ccs=
@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_ccs@rand=
om-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/=
igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">=
Intel XE#787</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12862/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">In=
tel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12862/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt=
@kms_content_protection@legacy.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_content_protection@lic-type-0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12862/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/sha=
rd-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +1 other test ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-2/igt@kms_content_protection@srm.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#11=
78</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2862/shard-bmg-7/igt@kms_content_protection@srm.html">INCOMPLETE</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt=
@kms_content_protection@srm.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) +1 =
other test ( 1 fail, 1 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_content_protection@uevent.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel =
XE#1188</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12862/shard-dg2-435/igt@kms_content_protection@uevent.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-4=
64/igt@kms_content_protection@uevent.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12862/shard-bmg-4/igt@kms_content_protection@uevent.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt=
@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-=
vs-cursor-legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-legacy.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3226">Intel XE#3226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-f=
lipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-int=
erruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12862/shard-dg2-463/igt@kms_flip@2x-absolute-wf_vblank-interrupt=
ible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Int=
el XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12862/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">In=
tel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-i=
nterruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@kms_flip@2x-fli=
p-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@km=
s_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt=
@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shar=
d-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-d=
p4.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12862/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862=
/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12862/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblan=
k@c-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12862/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html"=
>FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3149">Intel XE#3149</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel X=
E#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2597">Intel XE#2597</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html">INCOM=
PLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862=
/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE=
#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel X=
E#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12862/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-6/i=
gt@kms_flip@plain-flip-fb-recreate.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">=
Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12862/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862=
/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#=
886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-x=
tile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-adlp-1/igt@kms_flip_s=
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
e/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_frontbuffer_track=
ing@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_frontbuffe=
r_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1=
 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312">Intel XE#2312</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-2/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontb=
uffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141=
">Intel XE#4141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_t=
racking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2050">Intel XE#2050</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12862/shard-bmg-1/igt@kms_frontbuffer_tracking@f=
bc-rgb565-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-r=
gb565-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbu=
ffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-46=
4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbu=
ffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-46=
6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/651">Intel XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-466/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 oth=
er tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-in=
dfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@k=
ms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"=
>Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-435/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_=
frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-7/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer=
_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-433/igt@km=
s_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Int=
el XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_frontb=
uffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">In=
tel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-8/igt@kms_frontbuffer_tra=
cking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-6/igt@kms_frontb=
uffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313=
">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/sh=
ard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-463/igt@kms_hdr@invalid=
-hdr.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel X=
E#2493</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12862/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-bmg-4/i=
gt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12862/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>)</li>
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
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-dg2-464/igt@kms_p=
lane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-=
lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/71=
8">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924">Intel =
XE#3924</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12862/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/shard-lnl-5=
/igt@kms_psr@fbc-psr2-primary-render.html">FAIL</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3924">Intel XE#3924</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Intel XE#4568=
</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12862/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/s=
hard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#172=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426=
">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12862/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
62/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (=
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
org/tree/intel-xe/IGTPW_12862/shard-bmg-4/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12862/shard-bmg-5/igt@kms_tiled_display@basic-test-p=
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
l XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12862/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel=
 XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12862/sh=
ard-dg2-464/igt@xe_peer2peer@write.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8291 -&gt; IGTPW_12862</li>
<li>Linux: xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874 -&gt; xe-2866-1=
2422ea031abd6ad50e63c8d3b655315ca2fccaa</li>
</ul>
<p>IGTPW_12862: 12862<br />
  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874: 274d97eed4e8376b7a66b89=
04066baed6a1ae874<br />
  xe-2866-12422ea031abd6ad50e63c8d3b655315ca2fccaa: 12422ea031abd6ad50e63c8=
d3b655315ca2fccaa</p>

</body>
</html>

--===============4952950240985346376==--
