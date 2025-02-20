Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ED6C021B1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 10:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D94410E915;
	Thu, 20 Feb 2025 10:23:53 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37E010E913;
 Thu, 20 Feb 2025 10:23:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8235044306981642683=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/kms=5Fproperties=3A_?=
 =?utf-8?q?Add_IN=5FFORMATS=5FASYNC_property?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Feb 2025 10:23:52 -0000
Message-ID: <174004703278.166451.14658093637604282401@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219093211.4059187-1-arun.r.murthy@intel.com>
In-Reply-To: <20250219093211.4059187-1-arun.r.murthy@intel.com>
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

--===============8235044306981642683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_properties: Add IN_FORMATS_ASYNC property
URL   : https://patchwork.freedesktop.org/series/145069/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8238_full -> XEIGTPW_12634_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12634_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12634_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12634_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-4/igt@kms_async_flips@async-flip-suspend-resume.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +2 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-dg2-set2:     [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-466/igt@kms_plane_multiple@tiling-4.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-435/igt@kms_plane_multiple@tiling-4.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12634_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2233])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#623])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1466])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#664])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#316]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1407]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#607])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#607])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1477])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +5 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2314] / [Intel XE#2894])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2191]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2191]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1512]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#367]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#367]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#367]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +16 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +14 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][34] ([Intel XE#4330]) +13 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#3442])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2669] / [Intel XE#3433]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#3432])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#3432]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2907])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#2669]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#787]) +97 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2724])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#314])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#314])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#306]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2325]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#306])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#373]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#373]) +10 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2252]) +9 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#1178]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#1178]) +2 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#3304])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2341])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][56] ([Intel XE#1188]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_content_protection@uevent.html
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#3278]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@kms_content_protection@uevent.html
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#1188]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#308]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2321]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2321]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1424]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2320]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#309])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#309]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#3226])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][69] ([Intel XE#4330]) +12 other tests dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2244])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2244]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2372])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#701])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#701])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [PASS][75] -> [SKIP][76] ([Intel XE#702])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-434/igt@kms_feature_discovery@display-2x.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1138])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#2316]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][80] -> [FAIL][81] ([Intel XE#3321]) +2 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][82] -> [FAIL][83] ([Intel XE#301]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1421]) +9 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [PASS][85] -> [SKIP][86] ([Intel XE#310]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-434/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2316]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][88] -> [DMESG-WARN][89] ([Intel XE#4330]) +33 other tests dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-463/igt@kms_flip@busy-flip.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [PASS][90] -> [DMESG-WARN][91] ([Intel XE#2955])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-434/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
    - shard-bmg:          [PASS][92] -> [DMESG-WARN][93] ([Intel XE#2955])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-4/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][94] ([Intel XE#301]) +4 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][95] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][96] ([Intel XE#2049]) +1 other test incomplete
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1397] / [Intel XE#1745])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1397])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#455]) +14 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1401] / [Intel XE#1745]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1401]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2293]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#651]) +14 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#4141]) +13 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [PASS][106] -> [SKIP][107] ([Intel XE#656])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2311]) +28 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#651]) +31 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#653]) +25 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2312]) +12 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1158])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2350])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#656]) +42 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2313]) +24 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#605])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#1503])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1503])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1450] / [Intel XE#2568])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1450]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#346])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#346])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#346])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#4090])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#2925])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#4090])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2501])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#356])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#356])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][131] ([Intel XE#616]) +5 other tests fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#3307])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][133] ([Intel XE#4212]) +2 other tests dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2763]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2763]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#2763]) +13 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#870])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][139] -> [FAIL][140] ([Intel XE#718])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1439] / [Intel XE#3141]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1489]) +7 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#2893]) +6 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#1489]) +8 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2387])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#1122])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1128])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_psr@pr-sprite-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1406]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2330]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1127])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#1127]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#3414] / [Intel XE#3904])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#3414])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2413]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#2413] / [Intel XE#374])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#374]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][160] -> [FAIL][161] ([Intel XE#2883]) +2 other tests fail
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [PASS][162] -> [SKIP][163] ([Intel XE#455]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#1499]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2168])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@kms_vrr@lobf.html
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#1499])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@kms_vrr@lobf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#1091] / [Intel XE#2849])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#1126]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#4259])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@xe_eudebug@discovery-race-sigint.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#4259])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@xe_eudebug@discovery-race-sigint.html
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#4259])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#2905]) +14 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2905]) +8 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#2905]) +8 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#688]) +6 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-bmg:          [PASS][177] -> [DMESG-WARN][178] ([Intel XE#1473] / [Intel XE#4330])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-8/igt@xe_evict@evict-large-multi-vm.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#2322]) +9 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#1392]) +11 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#288]) +21 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#2360]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#4322])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][184] ([Intel XE#1999]) +2 other tests fail
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#4045])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210]) -> ([PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [SKIP][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236]) ([Intel XE#378])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-2/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-8/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-8/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-3/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-3/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-6/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-6/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-5/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-5/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-8/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-7/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-7/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-4/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-4/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-2/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-3/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-7/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-4/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-4/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-7/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-7/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-5/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261]) -> ([PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [SKIP][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287]) ([Intel XE#2457])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-5/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-1/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-8/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-8/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-4/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-4/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-4/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-8/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-4/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-5/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-1/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-1/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-7/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-7/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-7/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-5/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-2/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-2/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-2/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-5/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-1/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@xe_module_load@load.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][288] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-435/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][289] ([Intel XE#977])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][290] ([Intel XE#2245])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][291] ([Intel XE#2284])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@xe_pm@d3cold-mocs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][292] ([Intel XE#2284])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@xe_pm@d3cold-mocs.html
    - shard-lnl:          NOTRUN -> [SKIP][293] ([Intel XE#2284])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [PASS][294] -> [DMESG-WARN][295] ([Intel XE#4330] / [Intel XE#569])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-433/igt@xe_pm@s3-basic.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][296] ([Intel XE#2284] / [Intel XE#366])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [PASS][297] -> [DMESG-WARN][298] ([Intel XE#4330] / [Intel XE#569]) +1 other test dmesg-warn
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [ABORT][299] ([Intel XE#4268])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [PASS][300] -> [DMESG-WARN][301] ([Intel XE#4330]) +9 other tests dmesg-warn
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-1/igt@xe_pm_residency@cpg-basic.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][302] ([Intel XE#944]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][303] ([Intel XE#944]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@xe_query@multigpu-query-topology.html
    - shard-lnl:          NOTRUN -> [SKIP][304] ([Intel XE#944]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          NOTRUN -> [SKIP][305] ([Intel XE#4130]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][306] ([Intel XE#4130]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-lnl:          NOTRUN -> [SKIP][307] ([Intel XE#4130]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [SKIP][308] ([Intel XE#4273])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@xe_sriov_flr@flr-twice.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][309] ([Intel XE#4273])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@xe_sriov_flr@flr-twice.html
    - shard-lnl:          NOTRUN -> [SKIP][310] ([Intel XE#4273])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     NOTRUN -> [ABORT][311] ([Intel XE#3075] / [Intel XE#3084])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][312] ([Intel XE#4199]) -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][314] ([Intel XE#2291]) -> [PASS][315] +2 other tests pass
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [DMESG-FAIL][316] ([Intel XE#4330]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][318] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][319] +1 other test pass
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][320] ([Intel XE#3321]) -> [PASS][321] +2 other tests pass
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][322] ([Intel XE#2955]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [SKIP][324] ([Intel XE#2316]) -> [PASS][325] +4 other tests pass
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][326] ([Intel XE#2955]) -> [PASS][327] +2 other tests pass
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:
    - shard-bmg:          [FAIL][328] ([Intel XE#2882]) -> [PASS][329] +3 other tests pass
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][330] ([Intel XE#3012]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [INCOMPLETE][332] -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [DMESG-WARN][334] ([Intel XE#2042] / [Intel XE#4330]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [DMESG-WARN][336] ([Intel XE#2042]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          [INCOMPLETE][338] -> [PASS][339] +1 other test pass
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][340] ([Intel XE#3924]) -> [PASS][341] +1 other test pass
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-bmg:          [INCOMPLETE][342] ([Intel XE#4170]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
    - shard-dg2-set2:     [INCOMPLETE][344] -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-433/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [DMESG-WARN][346] ([Intel XE#4330]) -> [PASS][347] +18 other tests pass
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@kms_sequence@get-idle.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@kms_sequence@get-idle.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][348] ([Intel XE#899]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][350] ([Intel XE#1522]) -> [PASS][351] +1 other test pass
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-large-external:
    - shard-dg2-set2:     [DMESG-WARN][352] ([Intel XE#1473] / [Intel XE#4330]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-463/igt@xe_evict@evict-beng-large-external.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@xe_evict@evict-beng-large-external.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [DMESG-WARN][354] ([Intel XE#4330]) -> [PASS][355] +48 other tests pass
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][356] -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s3-basic-exec:
    - shard-bmg:          [DMESG-WARN][358] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@xe_pm@s3-basic-exec.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][360] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#787]) -> [SKIP][363] ([Intel XE#455] / [Intel XE#787])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-463/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [DMESG-FAIL][364] ([Intel XE#4330]) -> [FAIL][365] ([Intel XE#1178]) +1 other test fail
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-466/igt@kms_content_protection@atomic.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][366] ([Intel XE#2291]) -> [DMESG-WARN][367] ([Intel XE#877])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][368] ([Intel XE#2311]) -> [SKIP][369] ([Intel XE#2312]) +13 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][370] ([Intel XE#2312]) -> [SKIP][371] ([Intel XE#2311]) +14 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][372] ([Intel XE#4141]) -> [SKIP][373] ([Intel XE#2312]) +6 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][374] ([Intel XE#2312]) -> [SKIP][375] ([Intel XE#4141]) +5 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#651]) -> [SKIP][377] ([Intel XE#656]) +2 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][378] ([Intel XE#2312]) -> [SKIP][379] ([Intel XE#2313]) +17 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#653]) -> [SKIP][381] ([Intel XE#656]) +2 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][382] ([Intel XE#2313]) -> [SKIP][383] ([Intel XE#2312]) +12 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][384] ([Intel XE#2426]) -> [FAIL][385] ([Intel XE#1729])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [FAIL][386] ([Intel XE#1729]) -> [SKIP][387] ([Intel XE#362])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
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
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4170]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4170
  [Intel XE#4199]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4199
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4259
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8238 -> IGTPW_12634

  IGTPW_12634: 12634
  IGT_8238: 7df82badac410a7ce2505df6064d44f0e094650c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f: 3d2fe90eb7c12b62ea0b181d227de9f9381c173f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/index.html

--===============8235044306981642683==
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
<tr><td><b>Series:</b></td><td>tests/kms_properties: Add IN_FORMATS_ASYNC p=
roperty</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/145069/">https://patchwork.freedesktop.org/series/145069/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12634/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12634/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8238_full -&gt; XEIGTPW_12634_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12634_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12634_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
634_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-4/igt@kms_async_flips@async-flip-suspend-resume.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2634/shard-bmg-8/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMP=
LETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-x=
tile-to-64bpp-xtile-downscaling.html">INCOMPLETE</a> +2 other tests incompl=
ete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-466/igt@kms_plane_multiple@tiling-4.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-d=
g2-435/igt@kms_plane_multiple@tiling-4.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-434/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-=
463/igt@xe_live_ktest@xe_migrate.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html">SKIP=
</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12634_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tile=
d-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/623">Intel XE#623</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_async_flips@test-cursor-atom=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_big_fb@y-tiled-16bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12634/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1=
920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_bw@connected-linear-tiling=
-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other te=
st skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_bw@linear-tiling-4-display=
s-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_ccs@crc-primary-basic-y-tile=
d-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +13 ot=
her tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basi=
c-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_cdclk@mode-transition-all-=
outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/314">Intel XE#314</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@kms_chamelium_color@ctm-blue-to-=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_chamelium_color@ctm-blue-to-=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-t=
o-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-=
nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-no=
nplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm=
-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_content_protection@atomic-dp=
ms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_content_protection@lic-typ=
e-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_content_protection@uevent.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1188">Intel XE#1188</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@kms_content_protection@uevent.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2321">Intel XE#2321</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12634/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"=
>Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12634/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_cursor_legacy@torture-bo@pip=
e-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4330">Intel XE#4330</a>) +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
4">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2372">Intel XE#2372</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_feature_discovery@chameliu=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/701">Intel XE#701</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-434/igt@kms_feature_discovery@display-2x.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/sh=
ard-dg2-464/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/=
igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-=
dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12634/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi=
-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-434/igt@kms_flip@2x-modeset-vs-vblank-race-interruptib=
le.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12634/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-463/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-463/ig=
t@kms_flip@busy-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +33 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-434/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1263=
4/shard-dg2-433/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">In=
tel XE#2955</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-4/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/=
shard-bmg-5/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel =
XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblan=
k@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblan=
k@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@kms_flip@plain-flip-ts-check-int=
erruptible@b-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incom=
plete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-x=
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
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-x=
tile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp=
-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other t=
ests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-=
offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +13 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb=
-plflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +28 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdr=
rs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +31 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_frontbuffer_tracking@plane=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-f=
bc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +42 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2313">Intel XE#2313</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@k=
ms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_hdr@static-toggle-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_invalid_mode@clock-too-high.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@=
pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1450">Intel XE#1450</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-435/igt@kms_joiner@basic-big-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_joiner@switch-modeset-ultr=
a-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_multipipe_modeset@basic-ma=
x-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_plane_scaling@intel-max-src-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) +2 other tests dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_plane_scaling@plane-downsc=
ale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@kms_plane_scaling@planes-upsca=
le-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpm=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3141">Intel XE#3141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-plane-move-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_psr@pr-sprite-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_rotation_crc@sprite-rotati=
on-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-c=
enter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_scaling_modes@scaling-mode-n=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2413">Intel XE#2413</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/374">Intel XE#374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@kms_scaling_modes@scaling-mode-n=
one@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/374">Intel XE#374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-=
lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc-stealing=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12634/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#=
2168</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#=
1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@sriov_basic@enable-vfs-autopro=
be-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@xe_compute_preempt@compute-thr=
eadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0=
xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@xe_eudebug@discovery-race-sigint=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4259">Intel XE#4259</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@xe_eudebug@discovery-race-sigi=
nt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4259">Intel XE#4259</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@xe_eudebug@discovery-race-sigint=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4259">Intel XE#4259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@xe_eudebug_online@writes-caching=
-sram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +14 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@xe_eudebug_online@writes-caching=
-sram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests skip<=
/li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@xe_eudebug_online@writes-cachi=
ng-sram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@xe_evict@evict-beng-large-cm.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/688">Intel XE#688</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-8/igt@xe_evict@evict-large-multi-vm.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-b=
mg-6/igt@xe_evict@evict-large-multi-vm.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel =
XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@xe_exec_basic@multigpu-once-user=
ptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind=
-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-=
batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@xe_live_ktest@xe_mocs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">=
Intel XE#4322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_=
mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-pages=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8238/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8238/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8238/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8238/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8238/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8238/shard-lnl-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-ln=
l-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8238/shard-lnl-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard=
-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/sh=
ard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
238/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8238/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8238/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12634/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/s=
hard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12634/shard-lnl-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12634/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12634/shard-lnl-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-l=
nl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1263=
4/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12634/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12634/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12634/shard-lnl-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shar=
d-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2634/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12634/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12634/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Inte=
l XE#378</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8238/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8238/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8238/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8238/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8238/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8238/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8238/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard=
-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
238/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8238/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8238/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/shard-bmg-6/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12634/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/s=
hard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12634/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12634/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1263=
4/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12634/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12634/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shar=
d-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2634/shard-bmg-7/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12634/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12634/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Int=
el XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-435/igt@xe_oa@non-privileged-map-oa-bu=
ffer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">I=
ntel XE#977</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">=
Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@xe_pm@d3cold-mocs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Inte=
l XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">In=
tel XE#2284</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@xe_pm@d3cold-mocs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Inte=
l XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-433/igt@xe_pm@s3-basic.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@xe=
_pm@s3-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-2/igt@xe_pm@s3-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-6/=
igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-1/igt@xe_pm_residency@cpg-basic.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7=
/igt@xe_pm_residency@cpg-basic.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +9 other =
tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-8/igt@xe_query@multigpu-query-gt-list.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-433/igt@xe_query@multigpu-query-topolo=
gy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-4/igt@xe_query@multigpu-query-topology=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@xe_sriov_auto_provisioning@resou=
rces-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +2 other tests =
skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@xe_sriov_auto_provisioning@res=
ources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test=
 skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-7/igt@xe_sriov_auto_provisioning@resou=
rces-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@xe_sriov_flr@flr-twice.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273"=
>Intel XE#4273</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@xe_sriov_flr@flr-twice.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/427=
3">Intel XE#4273</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@xe_sriov_flr@flr-twice.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273"=
>Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12634/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3075">Intel XE#3075</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4199">Intel XE#4199</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12634/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggl=
e.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Inte=
l XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12634/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-436/igt@km=
s_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +2 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2955">Intel XE#2955</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12634/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interr=
uptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">I=
ntel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12634/shard-bmg-7/igt@kms_flip@2x-plain-flip-interruptible.html">PA=
SS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2955">Intel XE#2955</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12634/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interrup=
tible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-6/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"=
>Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12634/shard-bmg-7/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html=
">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3012">Intel XE#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-j=
oiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">INCOM=
PLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12634/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/20=
42">Intel XE#2042</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_pm_rpm@system-suspen=
d-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/204=
2">Intel XE#2042</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12634/shard-dg2-466/igt@kms_pm_rpm@universal-planes-dpms.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-=
1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-e=
xceed-sf@pipe-b-edp-1.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-lnl-6/igt@kms_psr2_sf@psr2-ove=
rlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924">Inte=
l XE#3924</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12634/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation-cropping-bo=
ttom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4170">Intel XE#4170</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-2/igt@kms_rotation_crc@multip=
lane-rotation-cropping-bottom.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-433/igt@kms_rotation_crc@multiplane-rotation-cropping-=
bottom.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12634/shard-dg2-463/igt@kms_rotation_crc@multiplane-rotat=
ion-cropping-bottom.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-6/igt@kms_sequence@get-idle.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4=
330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2634/shard-bmg-8/igt@kms_sequence@get-idle.html">PASS</a> +18 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12634/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#152=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_126=
34/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-463/igt@xe_evict@evict-beng-large-external.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-434/igt@xe_evict@evict-beng-lar=
ge-external.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-insta=
ntfree-reopen.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-466/igt@xe_evict_ccs=
@evict-overcommit-standalone-instantfree-reopen.html">PASS</a> +48 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html">SKIP</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-1/=
igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-6/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#433=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569"=
>Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12634/shard-bmg-7/igt@xe_pm@s3-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">In=
tel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12634/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html=
">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-463/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-=
hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_ccs@crc-primary-basic=
-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-466/igt@kms_content_protection@atomic.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">=
Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12634/shard-dg2-434/igt@kms_content_protection@atomic.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12634/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggl=
e.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multi=
draw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-5/igt@kms_frontbuffer_trackin=
g@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-7/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-dg2-464/igt@kms_frontbuffer_t=
racking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12634/shard-bmg-4/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12634/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729=
">Intel XE#1729</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8238/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12634/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
362">Intel XE#362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8238 -&gt; IGTPW_12634</li>
</ul>
<p>IGTPW_12634: 12634<br />
  IGT_8238: 7df82badac410a7ce2505df6064d44f0e094650c @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f: 3d2fe90eb7c12b62ea0b181=
d227de9f9381c173f</p>

</body>
</html>

--===============8235044306981642683==--
