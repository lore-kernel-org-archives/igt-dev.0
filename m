Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8D0C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 17:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E3D10E107;
	Sun,  6 Apr 2025 17:12:42 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD01910E068;
 Sun,  6 Apr 2025 17:12:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1300819911833997616=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_intel-ci/meson=2Ebuild=3A_?=
 =?utf-8?q?Add_missing_xe-sriov-vm=2Eblocklist=2Etxt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 17:12:40 -0000
Message-ID: <174395956075.41104.17695964060115864109@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327170925.705874-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250327170925.705874-1-marcin.bernatowicz@linux.intel.com>
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

--===============1300819911833997616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci/meson.build: Add missing xe-sriov-vm.blocklist.txt
URL   : https://patchwork.freedesktop.org/series/146887/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8291_FULL -> XEIGTPW_12861_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12861_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12861_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12861_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-adlp:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-2/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-lnl:          [PASS][3] -> ([SKIP][4], [PASS][5])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-3/igt@kms_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-3/igt@kms_pm_rpm@basic-pci-d3-state.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-3/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@xe_module_load@unload:
    - shard-bmg:          NOTRUN -> ([PASS][6], [DMESG-WARN][7])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@xe_module_load@unload.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@xe_module_load@unload.html
    - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@xe_module_load@unload.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@xe_module_load@unload.html
    - shard-lnl:          [PASS][10] -> ([PASS][11], [DMESG-WARN][12])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-6/igt@xe_module_load@unload.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@xe_module_load@unload.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-3/igt@xe_module_load@unload.html

  * igt@xe_pm@d3hot-basic:
    - shard-lnl:          [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-7/igt@xe_pm@d3hot-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-3/igt@xe_pm@d3hot-basic.html

  * igt@xe_vm@large-binds-33554432:
    - shard-dg2-set2:     [PASS][15] -> ([ABORT][16], [PASS][17])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_vm@large-binds-33554432.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@xe_vm@large-binds-33554432.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@xe_vm@large-binds-33554432.html

  
#### Warnings ####

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][18] ([Intel XE#1178]) -> ([INCOMPLETE][19], [FAIL][20]) ([Intel XE#1178]) +1 other test ( 1 fail, 1 incomplete )
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-2/igt@kms_content_protection@srm.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_content_protection@srm.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][21] -> ([PASS][22], [SKIP][23])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12861_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][24] -> ([FAIL][25], [FAIL][26]) ([Intel XE#4665])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [PASS][27] -> ([FAIL][28], [PASS][29]) ([Intel XE#3719] / [Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][30], [SKIP][31]) ([Intel XE#3767]) +7 other tests ( 2 skip )
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2327]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#316]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][34], [SKIP][35]) ([Intel XE#2327]) +1 other test ( 2 skip )
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][36], [SKIP][37]) ([Intel XE#1124]) +3 other tests ( 2 skip )
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][38] ([Intel XE#4543]) +2 other tests dmesg-fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][39], [SKIP][40]) ([Intel XE#607])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> ([SKIP][41], [SKIP][42]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1124]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> ([SKIP][44], [SKIP][45]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1124]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1124]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [PASS][48] -> ([SKIP][49], [SKIP][50]) ([Intel XE#2191])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#2191])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#2314] / [Intel XE#2894])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> ([SKIP][54], [SKIP][55]) ([Intel XE#367])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#367])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> ([SKIP][57], [SKIP][58]) ([Intel XE#1512])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#787]) +20 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#787]) +194 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][62], [SKIP][63]) ([Intel XE#455] / [Intel XE#787]) +8 other tests ( 2 skip )
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2887]) +10 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][65], [SKIP][66]) ([Intel XE#2887]) +6 other tests ( 2 skip )
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#3442])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-bmg:          NOTRUN -> [INCOMPLETE][68] ([Intel XE#3862]) +1 other test incomplete
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#3432])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][71], [SKIP][72]) ([Intel XE#3432])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][73], [SKIP][74]) ([Intel XE#2652] / [Intel XE#787]) +7 other tests ( 2 skip )
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][75], [SKIP][76]) ([Intel XE#787]) +42 other tests ( 2 skip )
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#455] / [Intel XE#787]) +40 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][78] -> [INCOMPLETE][79] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][80], [SKIP][81]) ([Intel XE#2887]) +3 other tests ( 2 skip )
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-WARN][82], [PASS][83]) ([Intel XE#1727] / [Intel XE#3113])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][84] ([Intel XE#3124])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][85], [DMESG-WARN][86]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][87] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][88] -> ([PASS][89], [DMESG-WARN][90]) ([Intel XE#1727])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#4417]) +7 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#306])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> ([SKIP][93], [SKIP][94]) ([Intel XE#2325])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#306])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_chamelium_color@ctm-max.html
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2325])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> ([SKIP][97], [SKIP][98]) ([Intel XE#2252]) +3 other tests ( 2 skip )
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2252]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#373]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#373])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> ([SKIP][103], [SKIP][104]) ([Intel XE#373])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#373]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][106], [FAIL][107]) ([Intel XE#1178])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][108] ([Intel XE#3304])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2321]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2320]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-bmg:          NOTRUN -> ([SKIP][111], [SKIP][112]) ([Intel XE#2320]) +1 other test ( 2 skip )
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> ([SKIP][113], [SKIP][114]) ([Intel XE#1424])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#308])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     NOTRUN -> ([PASS][116], [INCOMPLETE][117]) ([Intel XE#4148]) +1 other test ( 1 incomplete, 1 pass )
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> ([SKIP][118], [SKIP][119]) ([Intel XE#2286])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-dg2-set2:     [PASS][120] -> ([SKIP][121], [PASS][122]) ([Intel XE#309]) +2 other tests ( 1 pass, 1 skip )
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#309]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> ([SKIP][124], [SKIP][125]) ([Intel XE#309])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [PASS][126] -> ([SKIP][127], [PASS][128]) ([Intel XE#2291]) +2 other tests ( 1 pass, 1 skip )
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2-set2:     [PASS][129] -> ([SKIP][130], [SKIP][131]) ([Intel XE#309])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#323])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> ([SKIP][133], [SKIP][134]) ([Intel XE#4210])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][135] -> ([SKIP][136], [PASS][137]) ([Intel XE#4302])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][138], [SKIP][139]) ([Intel XE#1340])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][140], [SKIP][141]) ([i915#3804])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#4354])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#4354])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> ([SKIP][144], [SKIP][145]) ([Intel XE#4354])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#4331])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#4331])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> ([SKIP][148], [SKIP][149]) ([Intel XE#2244])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][150], [SKIP][151]) ([Intel XE#4156]) +1 other test ( 2 skip )
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#703])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][153] -> [SKIP][154] ([Intel XE#310])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_flip@2x-absolute-wf_vblank.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][155] -> ([SKIP][156], [PASS][157]) ([Intel XE#310]) +7 other tests ( 1 pass, 1 skip )
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-busy-flip:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#310])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     NOTRUN -> [FAIL][159] ([Intel XE#3098]) +2 other tests fail
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][160] -> ([PASS][161], [FAIL][162]) ([Intel XE#301])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][163] -> [FAIL][164] ([Intel XE#3321]) +4 other tests fail
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][165] -> [FAIL][166] ([Intel XE#301])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#310])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [PASS][168] -> [SKIP][169] ([Intel XE#2316])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2316])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          NOTRUN -> ([SKIP][171], [PASS][172]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          NOTRUN -> ([PASS][173], [FAIL][174]) ([Intel XE#2882]) +1 other test ( 1 fail, 1 pass )
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
    - shard-dg2-set2:     [PASS][175] -> ([FAIL][176], [PASS][177]) ([Intel XE#3098] / [Intel XE#886])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][178] -> ([PASS][179], [SKIP][180]) ([Intel XE#2316]) +7 other tests ( 1 pass, 1 skip )
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][181] ([Intel XE#886]) +1 other test fail
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a2-dp2.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-bmg:          [PASS][182] -> ([PASS][183], [INCOMPLETE][184]) ([Intel XE#2049])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_flip@dpms-off-confusion-interruptible.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_flip@dpms-off-confusion-interruptible.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@dpms-off-confusion-interruptible@d-dp2:
    - shard-bmg:          [PASS][185] -> [INCOMPLETE][186] ([Intel XE#2049])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_flip@dpms-off-confusion-interruptible@d-dp2.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_flip@dpms-off-confusion-interruptible@d-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][187], [FAIL][188]) ([Intel XE#301])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][189] -> ([FAIL][190], [PASS][191]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][192] ([Intel XE#301]) +3 other tests fail
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - shard-bmg:          [PASS][193] -> ([FAIL][194], [PASS][195]) ([Intel XE#3321]) +4 other tests ( 1 fail, 1 pass )
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][196] ([Intel XE#301] / [Intel XE#3321]) +3 other tests fail
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][197] -> ([PASS][198], [INCOMPLETE][199]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          [PASS][200] -> [INCOMPLETE][201] ([Intel XE#2049] / [Intel XE#2597])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_flip@flip-vs-suspend@c-dp2.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [PASS][202] -> ([INCOMPLETE][203], [INCOMPLETE][204]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 2 incomplete )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [PASS][205] -> ([FAIL][206], [PASS][207]) ([Intel XE#3149] / [Intel XE#886])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-adlp:         NOTRUN -> [SKIP][208] ([Intel XE#455]) +9 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][209] ([Intel XE#455]) +9 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][210], [SKIP][211]) ([Intel XE#2293] / [Intel XE#2380]) +2 other tests ( 2 skip )
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][212], [SKIP][213]) ([Intel XE#2293]) +2 other tests ( 2 skip )
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][214] ([Intel XE#2293] / [Intel XE#2380])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2293])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][216], [SKIP][217]) ([Intel XE#1401] / [Intel XE#1745])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][218], [SKIP][219]) ([Intel XE#1401])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][220] ([Intel XE#1401] / [Intel XE#1745])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#1401])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][222] -> [DMESG-FAIL][223] ([Intel XE#4543])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][224], [SKIP][225]) ([Intel XE#651]) +4 other tests ( 2 skip )
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][226] ([Intel XE#656]) +16 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> ([SKIP][227], [SKIP][228]) ([Intel XE#2311] / [Intel XE#2312])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][229], [SKIP][230]) ([Intel XE#4141]) +3 other tests ( 2 skip )
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][231] -> ([SKIP][232], [PASS][233]) ([Intel XE#656]) +3 other tests ( 1 pass, 1 skip )
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][234], [SKIP][235]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][236] ([Intel XE#4141]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][237] ([Intel XE#651]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#651]) +15 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#2312]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][240], [SKIP][241]) ([Intel XE#2311]) +11 other tests ( 2 skip )
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#2311]) +13 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][243], [SKIP][244]) ([Intel XE#656]) +1 other test ( 2 skip )
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][245], [SKIP][246]) ([Intel XE#651]) +1 other test ( 2 skip )
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][247] ([Intel XE#2313]) +17 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][248], [SKIP][249]) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][250] ([Intel XE#656])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][251], [SKIP][252]) ([Intel XE#653]) +5 other tests ( 2 skip )
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][253] ([Intel XE#658])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][254], [SKIP][255]) ([Intel XE#2313]) +10 other tests ( 2 skip )
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][256] ([Intel XE#653]) +12 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][257] ([Intel XE#653]) +5 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][258] ([Intel XE#2502])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][259] ([Intel XE#1339])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][260] ([Intel XE#2340])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][261] -> ([PASS][262], [SKIP][263]) ([Intel XE#1503])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][264] -> ([PASS][265], [SKIP][266]) ([Intel XE#4328])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][267] ([Intel XE#2927])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][268] ([Intel XE#2927])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [PASS][269] -> ([SKIP][270], [SKIP][271]) ([Intel XE#4328])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][272] ([Intel XE#2925])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2-set2:     [PASS][273] -> ([SKIP][274], [SKIP][275]) ([Intel XE#4596])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-4.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][276] -> ([SKIP][277], [PASS][278]) ([Intel XE#4596])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-adlp:         NOTRUN -> [SKIP][279] ([Intel XE#4596]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][280] ([Intel XE#2493])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][281] ([Intel XE#2763]) +9 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> ([SKIP][282], [SKIP][283]) ([Intel XE#870])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][284] ([Intel XE#2938])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][285] ([Intel XE#2938])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][286] ([Intel XE#870]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][287] ([Intel XE#1129])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][288] -> ([SKIP][289], [SKIP][290]) ([Intel XE#836])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][291], [SKIP][292]) ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test ( 2 skip )
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][293] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][294] ([Intel XE#1489]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][295], [SKIP][296]) ([Intel XE#1489]) +1 other test ( 2 skip )
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][297] ([Intel XE#1489]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][298] ([Intel XE#1489]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
    - shard-bmg:          NOTRUN -> ([SKIP][299], [SKIP][300]) ([Intel XE#1489]) +2 other tests ( 2 skip )
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][301] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][302] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> ([SKIP][303], [SKIP][304]) ([Intel XE#2234] / [Intel XE#2850]) +8 other tests ( 2 skip )
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_psr@psr2-cursor-plane-move.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][305] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][306] ([Intel XE#3414])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-bmg:          NOTRUN -> [SKIP][307] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][308] ([Intel XE#3414])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][309] ([Intel XE#1435])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-dg2-set2:     [PASS][310] -> ([PASS][311], [SKIP][312]) ([Intel XE#455])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][313] -> ([FAIL][314], [FAIL][315]) ([Intel XE#771] / [Intel XE#899]) +1 other test ( 2 fail )
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@wait-forked-hang@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([INCOMPLETE][316], [PASS][317]) ([Intel XE#4488]) +1 other test ( 1 incomplete, 1 pass )
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_vblank@wait-forked-hang@pipe-a-hdmi-a-3.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_vblank@wait-forked-hang@pipe-a-hdmi-a-3.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][318], [SKIP][319]) ([Intel XE#455]) +1 other test ( 2 skip )
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_vrr@flip-dpms.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> ([SKIP][320], [SKIP][321]) ([Intel XE#1499])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_vrr@max-min.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][322] -> ([SKIP][323], [PASS][324]) ([Intel XE#1499])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-adlp:         NOTRUN -> [SKIP][325] ([Intel XE#756])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> [ABORT][326] ([Intel XE#2705] / [Intel XE#4540])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [PASS][327] -> ([FAIL][328], [FAIL][329]) ([Intel XE#4278]) +1 other test ( 2 fail )
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@xe_compute_preempt@compute-preempt-many.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-lnl:          [PASS][330] -> ([FAIL][331], [PASS][332]) ([Intel XE#4278]) +1 other test ( 1 fail, 1 pass )
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-8/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][333] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][334] ([Intel XE#1062])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_create@create-big-vram.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][335] ([Intel XE#4497])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][336] ([Intel XE#2905]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][337] ([Intel XE#2905] / [Intel XE#3889])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-bmg:          NOTRUN -> [SKIP][338] ([Intel XE#2905] / [Intel XE#3889]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][339], [SKIP][340]) ([Intel XE#2905])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@xe_eudebug_online@pagefault-read.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][341] ([Intel XE#2905]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          NOTRUN -> ([SKIP][342], [SKIP][343]) ([Intel XE#2905]) +3 other tests ( 2 skip )
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@xe_eudebug_online@resume-one.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@xe_eudebug_online@resume-one.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-dg2-set2:     NOTRUN -> [SKIP][344] ([Intel XE#4577])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-adlp:         NOTRUN -> [SKIP][345] ([Intel XE#2905]) +3 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         NOTRUN -> [SKIP][346] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][347] -> ([SKIP][348], [SKIP][349]) ([Intel XE#1392])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][350] ([Intel XE#2322]) +3 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
    - shard-dg2-set2:     [PASS][351] -> [SKIP][352] ([Intel XE#1392]) +2 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> ([PASS][353], [SKIP][354]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][355] -> ([PASS][356], [SKIP][357]) ([Intel XE#1392]) +7 other tests ( 1 pass, 1 skip )
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-adlp:         NOTRUN -> [SKIP][358] ([Intel XE#1392]) +2 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> ([SKIP][359], [SKIP][360]) ([Intel XE#2322]) +5 other tests ( 2 skip )
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][361], [SKIP][362]) ([Intel XE#288]) +3 other tests ( 2 skip )
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][363] ([Intel XE#288]) +8 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][364] ([Intel XE#288]) +13 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][365] ([Intel XE#2360])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:
    - shard-adlp:         [PASS][366] -> [DMESG-WARN][367] ([Intel XE#4173])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-1/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-2/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][368] ([Intel XE#1999]) +2 other tests fail
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][369] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         NOTRUN -> [SKIP][370] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_oa@rc6-disable.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][371] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> ([SKIP][372], [SKIP][373]) ([Intel XE#1061])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-3/igt@xe_peer2peer@read.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][374] ([Intel XE#1173]) +1 other test fail
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][375], [FAIL][376]) ([Intel XE#1173])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][377] ([Intel XE#1948])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][378] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [PASS][379] -> ([ABORT][380], [PASS][381]) ([Intel XE#4640])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@xe_pm@s3-exec-after.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@xe_pm@s3-exec-after.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][382] -> [ABORT][383] ([Intel XE#1794]) +1 other test abort
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-6/igt@xe_pm@s4-basic.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-9/igt@xe_pm@s4-basic.html
    - shard-lnl:          [PASS][384] -> ([PASS][385], [ABORT][386]) ([Intel XE#1794]) +1 other test ( 1 abort, 1 pass )
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-7/igt@xe_pm@s4-basic.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@xe_pm@s4-basic.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pmu@engine-activity-load:
    - shard-bmg:          NOTRUN -> ([PASS][387], [INCOMPLETE][388]) ([Intel XE#4630]) +1 other test ( 1 incomplete, 1 pass )
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@xe_pmu@engine-activity-load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@xe_pmu@engine-activity-load.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][389] ([Intel XE#944]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> ([SKIP][390], [SKIP][391]) ([Intel XE#944])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-6/igt@xe_query@multigpu-query-invalid-size.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][392] ([Intel XE#944]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html
    - shard-adlp:         NOTRUN -> [SKIP][393] ([Intel XE#944])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][394] ([Intel XE#4130])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          NOTRUN -> [SKIP][395] ([Intel XE#4273])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [DMESG-WARN][396] ([Intel XE#4173]) -> [PASS][397] +11 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@core_hotunplug@hotreplug.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-1/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][398] ([Intel XE#4543]) -> [PASS][399] +1 other test pass
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-1/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][400] ([Intel XE#3908]) -> [PASS][401] +1 other test pass
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#2191]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][404] ([Intel XE#1727] / [Intel XE#3113]) -> ([PASS][405], [PASS][406])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#309]) -> ([PASS][408], [PASS][409])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#309]) -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][412] ([Intel XE#2291]) -> ([PASS][413], [PASS][414]) +1 other test ( 2 pass )
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#4354]) -> ([PASS][416], [PASS][417])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-sst.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#310]) -> ([PASS][419], [PASS][420]) +1 other test ( 2 pass )
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][421] ([Intel XE#3321]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][423] ([Intel XE#301]) -> [PASS][424] +2 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][425] ([Intel XE#2316]) -> ([PASS][426], [PASS][427]) +2 other tests ( 2 pass )
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][428] ([Intel XE#2049] / [Intel XE#2597]) -> ([PASS][429], [PASS][430]) +1 other test ( 2 pass )
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][431] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][433] ([Intel XE#4543]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][435] ([Intel XE#1874]) -> [PASS][436]
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#656]) -> ([PASS][438], [PASS][439])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#656]) -> [PASS][441] +1 other test pass
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#836]) -> ([PASS][443], [PASS][444])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1392]) -> ([PASS][446], [PASS][447]) +7 other tests ( 2 pass )
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [FAIL][448] ([Intel XE#4541]) -> [PASS][449]
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-1/igt@xe_oa@buffer-size.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-3/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][450] ([Intel XE#1794]) -> [PASS][451] +1 other test pass
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][452] ([Intel XE#1794]) -> ([PASS][453], [PASS][454])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@xe_pm@s4-exec-after.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][455] ([Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][456] ([Intel XE#4543])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][457] ([Intel XE#4173] / [Intel XE#4543]) -> [DMESG-FAIL][458] ([Intel XE#4543])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#787]) -> ([SKIP][460], [SKIP][461]) ([Intel XE#455] / [Intel XE#787]) +4 other tests ( 2 skip )
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][463] ([Intel XE#787]) +4 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][465], [SKIP][466]) ([Intel XE#787]) +2 other tests ( 2 skip )
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#787]) -> [SKIP][468] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][469] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> ([INCOMPLETE][470], [PASS][471]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][472] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([INCOMPLETE][473], [ABORT][474]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][475] ([Intel XE#1727] / [Intel XE#3113]) -> ([INCOMPLETE][476], [INCOMPLETE][477]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][478] ([Intel XE#1727] / [Intel XE#3113]) -> [ABORT][479] ([Intel XE#1727])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#4418]) -> ([SKIP][481], [SKIP][482]) ([Intel XE#4418] / [Intel XE#4440])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][483] ([Intel XE#1178]) -> ([FAIL][484], [SKIP][485]) ([Intel XE#1178] / [Intel XE#2341])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][486] ([Intel XE#1188]) -> [SKIP][487] ([Intel XE#2341])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_content_protection@uevent.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#309]) -> ([SKIP][489], [PASS][490]) ([Intel XE#309])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#4302]) -> ([SKIP][492], [PASS][493]) ([Intel XE#4302])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][494] ([Intel XE#886]) -> ([SKIP][495], [PASS][496]) ([Intel XE#310])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][497] ([Intel XE#301]) -> ([PASS][498], [FAIL][499]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][500] ([Intel XE#301] / [Intel XE#3149]) -> ([PASS][501], [FAIL][502]) ([Intel XE#301] / [Intel XE#3149]) +1 other test ( 1 fail, 1 pass )
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][503] ([Intel XE#2049] / [Intel XE#2597]) -> ([INCOMPLETE][504], [PASS][505]) ([Intel XE#2049] / [Intel XE#2597])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-lnl:          [FAIL][506] ([Intel XE#886]) -> ([FAIL][507], [PASS][508]) ([Intel XE#3149] / [Intel XE#886])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][509] ([Intel XE#886]) -> ([FAIL][510], [PASS][511]) ([Intel XE#886]) +1 other test ( 1 fail, 1 pass )
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][512] ([Intel XE#4543]) -> [DMESG-FAIL][513] ([Intel XE#324] / [Intel XE#4543]) +3 other tests dmesg-fail
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#656]) -> ([SKIP][515], [SKIP][516]) ([Intel XE#651]) +6 other tests ( 2 skip )
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][517] ([Intel XE#2311]) -> ([SKIP][518], [SKIP][519]) ([Intel XE#2311] / [Intel XE#2312]) +15 other tests ( 2 skip )
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#651]) -> ([SKIP][521], [SKIP][522]) ([Intel XE#651] / [Intel XE#656]) +8 other tests ( 2 skip )
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][523] ([Intel XE#2312]) -> ([SKIP][524], [SKIP][525]) ([Intel XE#2311]) +3 other tests ( 2 skip )
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][526] ([Intel XE#2311]) -> ([SKIP][527], [SKIP][528]) ([Intel XE#2312])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][529] ([Intel XE#2311]) -> [SKIP][530] ([Intel XE#2312]) +1 other test skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#656]) -> [SKIP][532] ([Intel XE#651])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#651]) -> [SKIP][534] ([Intel XE#656]) +4 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][535] ([Intel XE#4141]) -> ([SKIP][536], [SKIP][537]) ([Intel XE#2312] / [Intel XE#4141]) +4 other tests ( 2 skip )
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][538] ([Intel XE#4141]) -> [SKIP][539] ([Intel XE#2312]) +4 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#656]) -> ([SKIP][541], [PASS][542]) ([Intel XE#656]) +1 other test ( 1 pass, 1 skip )
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][543] ([Intel XE#2312]) -> [SKIP][544] ([Intel XE#4141])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][545] ([Intel XE#2312]) -> ([SKIP][546], [SKIP][547]) ([Intel XE#4141]) +1 other test ( 2 skip )
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][548] ([Intel XE#4141]) -> ([SKIP][549], [SKIP][550]) ([Intel XE#2312])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][551] ([Intel XE#2312]) -> ([SKIP][552], [SKIP][553]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][554] ([Intel XE#2050]) -> ([SKIP][555], [SKIP][556]) ([Intel XE#4141])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][557] ([Intel XE#2312]) -> ([SKIP][558], [SKIP][559]) ([Intel XE#2311] / [Intel XE#2312])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#656]) -> ([SKIP][561], [SKIP][562]) ([Intel XE#651] / [Intel XE#656]) +1 other test ( 2 skip )
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#651]) -> ([SKIP][564], [SKIP][565]) ([Intel XE#656])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#653]) -> ([SKIP][567], [SKIP][568]) ([Intel XE#656]) +2 other tests ( 2 skip )
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][569] ([Intel XE#2313]) -> [SKIP][570] ([Intel XE#2312]) +4 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#656]) -> ([SKIP][572], [SKIP][573]) ([Intel XE#653] / [Intel XE#656]) +2 other tests ( 2 skip )
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][574] ([Intel XE#2313]) -> ([SKIP][575], [SKIP][576]) ([Intel XE#2312])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#656]) -> ([SKIP][578], [SKIP][579]) ([Intel XE#653]) +5 other tests ( 2 skip )
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#653]) -> [SKIP][581] ([Intel XE#656]) +1 other test skip
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][582] ([Intel XE#656]) -> [SKIP][583] ([Intel XE#653])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][584] ([Intel XE#2313]) -> ([SKIP][585], [SKIP][586]) ([Intel XE#2312] / [Intel XE#2313]) +12 other tests ( 2 skip )
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][587] ([Intel XE#653]) -> ([SKIP][588], [SKIP][589]) ([Intel XE#653] / [Intel XE#656]) +11 other tests ( 2 skip )
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][590] ([Intel XE#2312]) -> ([SKIP][591], [SKIP][592]) ([Intel XE#2313]) +4 other tests ( 2 skip )
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][593] ([Intel XE#2312]) -> ([SKIP][594], [SKIP][595]) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#4596]) -> [SKIP][597] ([Intel XE#455])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][598] ([Intel XE#4540]) -> ([ABORT][599], [ABORT][600]) ([Intel XE#2705] / [Intel XE#4540])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [ABORT][601] ([Intel XE#4540]) -> ([ABORT][602], [ABORT][603]) ([Intel XE#4502] / [Intel XE#4540])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][604] ([Intel XE#718]) -> ([FAIL][605], [PASS][606]) ([Intel XE#718])
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][607] ([Intel XE#2426]) -> ([SKIP][608], [SKIP][609]) ([Intel XE#2426] / [Intel XE#2509])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][610] ([Intel XE#771]) -> ([FAIL][611], [FAIL][612]) ([Intel XE#771] / [Intel XE#899])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][613] ([Intel XE#771]) -> ([PASS][614], [FAIL][615]) ([Intel XE#899])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][616] ([Intel XE#1392]) -> ([SKIP][617], [PASS][618]) ([Intel XE#1392])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#1061]) -> ([FAIL][620], [FAIL][621]) ([Intel XE#1173])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8291/shard-dg2-432/igt@xe_peer2peer@write.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@xe_peer2peer@write.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@xe_peer2peer@write.html

  
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
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4148]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4148
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4630
  [Intel XE#4640]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4640
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
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
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8291 -> IGTPW_12861
  * Linux: xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874 -> xe-2865-40517c3b252128d0a75e8d3fe86d88a04d1951bf

  IGTPW_12861: 12861
  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874: 274d97eed4e8376b7a66b8904066baed6a1ae874
  xe-2865-40517c3b252128d0a75e8d3fe86d88a04d1951bf: 40517c3b252128d0a75e8d3fe86d88a04d1951bf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/index.html

--===============1300819911833997616==
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
<tr><td><b>Series:</b></td><td>intel-ci/meson.build: Add missing xe-sriov-v=
m.blocklist.txt</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146887/">https://patchwork.freedesktop.org/series/146887/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12861/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12861/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8291_FULL -&gt; XEIGTPW_12861_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12861_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12861_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
861_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
861/shard-adlp-2/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">INCOMPLE=
TE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-3/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-=
lnl-3/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-3/igt@kms_pm_rpm@ba=
sic-pci-d3-state.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@xe_module_load@unload.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/sha=
rd-bmg-1/igt@xe_module_load@unload.html">DMESG-WARN</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@xe_module_load@unload.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433=
/igt@xe_module_load@unload.html">DMESG-WARN</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-6/igt@xe_module_load@unload.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/ig=
t@xe_module_load@unload.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12861/shard-lnl-3/igt@xe_module_load@unload.html">D=
MESG-WARN</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-7/igt@xe_pm@d3hot-basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-3/igt@x=
e_pm@d3hot-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-33554432:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_vm@large-binds-33554432.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-d=
g2-433/igt@xe_vm@large-binds-33554432.html">ABORT</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@xe_vm@large-=
binds-33554432.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-2/igt@kms_content_protection@srm.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#11=
78</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2861/shard-bmg-2/igt@kms_content_protection@srm.html">INCOMPLETE</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt=
@kms_content_protection@srm.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test ( 1=
 fail, 1 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">SKIP</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12861/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip=
-overlay.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12861/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12861_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/=
igt@intel_hwmon@hwmon-write.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@intel_hwmon@hwmon-write.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12861/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-fl=
ip-events-atomic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12861/shard-lnl-4/igt@kms_async_flips@async-flip-with-page=
-flip-events-atomic.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other test=
s ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-=
4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt=
@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-c=
cs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3767">Intel XE#3767</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_big_fb@4-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-=
270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12861/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rota=
te-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12861/shard-dg2-463/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate=
-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-o=
verflow.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12861/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stri=
de-64bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotat=
e-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12861/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560=
x1440p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12861/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displ=
ays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-dis=
plays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_bw@connected-linear-tiling-=
3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_bw@connected-linear-tiling-=
3-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_bw@connected-linear-tiling-=
3-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays=
-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12861/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-1920x1080=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays=
-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12861/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-3840x2160=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tile=
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
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tile=
d-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-til=
ed-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +194 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_ccs@ccs-on-anothe=
r-bo-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-18=
0-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_ccs@crc-primary-rotatio=
n-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests =
( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3442">Intel XE#3442</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-d=
g2-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_ccs@crc-sprite-p=
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
g/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@cr=
c-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) +42 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +40 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel=
 XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_ccs@rand=
om-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">INCOMPLETE</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_ccs@rand=
om-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">DMESG-WARN</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE=
#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel =
XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@random-ccs-data-=
4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe=
-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_chamelium_color@ctm-blue-t=
o-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_chamelium_color@ctm-green-t=
o-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12861/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325"=
>Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_chamelium_color@ctm-max.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-ch=
ange-during-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-ch=
ange-during-hibernate.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-storm-=
disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-fa=
st.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12861/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel =
XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-after=
-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12861/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-with=
-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12861/shard-dg2-435/igt@kms_content_protection@atomic-dpm=
s@pipe-a-dp-4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_cursor_crc@cursor-random-ma=
x-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12861/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
0">Intel XE#2320</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-mov=
ement-128x42.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12861/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128=
x42.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_cursor_crc@cursor-rapid-mov=
ement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12861/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4148">Int=
el XE#4148</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_cursor_legacy@basic=
-busy-flip-before-cursor-varying-size.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-varying-siz=
e.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12861/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-varying-=
size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12861/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-varying-siz=
e.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/309">Intel XE#309</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-v=
arying-size.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12861/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic=
-transitions.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12861/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomi=
c-transitions.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests ( 1 pass, 1 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-siz=
e.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12861/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-=
size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12861/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-siz=
e.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2861/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1286=
1/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/i=
gt@kms_display_modes@extended-mode-basic.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c@pipe-a-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pi=
pe-a-hdmi-a-3.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_dp_link_training@non-uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4354">Intel XE#4354</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2861/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_dp_linktrain_fallback@dsc-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12861/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#=
2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_fbcon_fbt@fbc-suspend.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861=
/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>) +1=
 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_feature_discovery@display-=
3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_flip@2x-absolute-wf_vblank.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shar=
d-dg2-464/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12861/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard=
-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310=
</a>) +7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_flip@2x-busy-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">=
Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-rac=
e-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3098">Intel XE#3098</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861=
/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/i=
gt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12861/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-=
dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12861/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi=
-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs=
-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1286=
1/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE=
#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/sh=
ard-bmg-6/igt@kms_flip@2x-plain-flip.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other=
 test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recre=
ate.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12861/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Int=
el XE#2882</a>) +1 other test ( 1 fail, 1 pass )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861=
/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/i=
gt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12861/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12861/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2316">Intel XE#2316</a>) +7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recr=
eate@bc-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_flip@dpms-off-confusion-interruptible.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12861/shard-bmg-4/igt@kms_flip@dpms-off-confusion-interruptible.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard=
-bmg-1/igt@kms_flip@dpms-off-confusion-interruptible.html">INCOMPLETE</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel=
 XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_flip@dpms-off-confusion-interruptible@d-dp2.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12861/shard-bmg-1/igt@kms_flip@dpms-off-confusion-interruptible@d-dp2.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_flip@flip-vs-expired-vbla=
nk.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12861/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel =
XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12861/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
61/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblan=
k@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12861/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard=
-bmg-2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#33=
21</a>) +4 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblan=
k@d-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2861/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-d=
g2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE=
#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2597">Intel XE#2597</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_flip@flip-vs-suspend@c-dp2.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-=
bmg-5/igt@kms_flip@flip-vs-suspend@c-dp2.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Inte=
l XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/sha=
rd-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt=
@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) +1 other test ( 2 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
61/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5=
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
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-=
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
/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp=
-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-64bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip_scaled_crc@=
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
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@k=
ms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2293">Intel XE#2293</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-=
ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@kms_flip_scaled_crc=
@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Inte=
l XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-=
ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt=
@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-de=
fault-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-=
a-1-x-to-y.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12861/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@p=
ipe-c-hdmi-a-1-x-to-y.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_frontbuffer_track=
ing@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p=
-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@fb=
c-1p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests =
( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb=
-plflip-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-shrfb-plflip-blt.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests =
( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_track=
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
/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 =
other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrr=
s-rgb101010-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcps=
r-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653<=
/a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcps=
r-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p=
-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tes=
ts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_getfb@getfb-reject-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1339">Intel XE#1339</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_getfb@getfb2-accept-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-=
bmg-2/igt@kms_hdr@static-toggle-suspend.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_hdr@stati=
c-toggle-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/=
shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt=
@kms_joiner@basic-force-big-joiner.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_joiner@basic-ultra-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.ht=
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
TPW_12861/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
61/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328"=
>Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_joiner@invalid-modeset-for=
ce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/sha=
rd-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_p=
lane_multiple@2x-tiling-4.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard=
-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_plane_m=
ultiple@2x-tiling-x.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_plane_multiple@2x-tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4596">Intel XE#4596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_pm_backlight@bad-brightness=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12861/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#8=
70</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_pm_backlight@brightness-wit=
h-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_pm_backlight@brightness-wi=
th-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Int=
el XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1286=
1/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464=
/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/s=
hard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a>) (<a href=3D"https://=
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
/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.h=
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
/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-d=
mg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1489">Intel XE#1489</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-=
move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-mov=
e-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_psr@fbc-psr-cursor-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_psr@psr2-cursor-plane-move.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12861/shard-bmg-8/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#22=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_psr@psr2-sprite-render.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-form=
at.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3414">Intel XE#3414</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1435">Intel XE#1435</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
861/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2=
-464/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a>) (<a href=3D"=
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
IGTPW_12861/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12861/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/771">Intel XE#771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/899">Intel XE#899</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_vblank@wait-forked-hang@pip=
e-a-hdmi-a-3.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_vblank@wait-forked-hang@pipe-a=
-hdmi-a-3.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4488">Intel XE#4488</a>) +1 other test ( 1 incomplete, 1 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard=
-dg2-463/igt@kms_vrr@flip-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test ( =
2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_vrr@max-min.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg=
-5/igt@kms_vrr@max-min.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/i=
gt@kms_vrr@negative-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_vrr@negative-basic.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_writeback@writeback-pixel-f=
ormats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@testdisplay.html">ABORT</a> (<=
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
861/shard-bmg-2/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg=
-6/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>=
) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many@engine-d=
rm_xe_engine_class_compute.html">PASS</a> -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-8/igt@xe_compute_preempt@c=
ompute-preempt-many@engine-drm_xe_engine_class_compute.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/ig=
t@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_comput=
e.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4278">Intel XE#4278</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@xe_compute_preempt@compute-thr=
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
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_create@create-big-vram.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@xe_eu_stall@blocking-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufenc=
e-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-=
sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@xe_eudebug_online@pagefault-r=
ead.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12861/shard-dg2-436/igt@xe_eudebug_online@pagefault-read.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Int=
el XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@xe_eudebug_online@resume-dss.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@xe_eudebug_online@resume-one.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
861/shard-bmg-6/igt@xe_eudebug_online@resume-one.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905=
</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_eudebug_online@set-breakpoi=
nt-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_eudebug_online@writes-cachin=
g-vram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_evict@evict-beng-small.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
61">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_exec_basic@m=
ultigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg=
2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-user=
ptr-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests =
skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-null-defer-bind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-rebind.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_exec_basic@multig=
pu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 ot=
her test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12861/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mm=
ap.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12861/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1392">Intel XE#1392</a>) +7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bas=
ic-defer-bind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12861/shard-bmg-7/igt@xe_exec_basic@multigpu-once-basic-defer=
-bind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2322">Intel XE#2322</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@xe_exec_fault_mode@many-execq=
ueues-basic-imm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12861/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-=
basic-imm.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/288">Intel XE#288</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr=
-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind=
-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-=
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
-xe/IGTPW_12861/shard-adlp-2/igt@xe_fault_injection@vm-bind-fail-xe_sync_en=
try_parse.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_=
mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-a=
ccess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_oa@rc6-disable.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Int=
el XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_oa@syncs-syncobj-cfg.html">=
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
g/tree/intel-xe/IGTPW_12861/shard-lnl-3/igt@xe_peer2peer@read.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-l=
nl-1/igt@xe_peer2peer@read.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vr=
am01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@xe_peer2peer@write@write-gpua=
-vram01-gpub-system-p2p.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948"=
>Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@=
xe_pm@s3-exec-after.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@xe_pm@s3-exec-after.html">PASS</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4640">I=
ntel XE#4640</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-6/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-9/igt@xe_p=
m@s4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-7/igt@xe_pm@s4-basic.html">PASS</a> -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/igt@xe_pm=
@s4-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12861/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@xe_pmu@engine-activity-load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
61/shard-bmg-7/igt@xe_pmu@engine-activity-load.html">INCOMPLETE</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4630">Intel XE#46=
30</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_query@multigpu-query-invali=
d-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12861/shard-lnl-6/igt@xe_query@multigpu-query-invalid=
-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12861/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">=
Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@xe_query@multigpu-query-mem-usag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@xe_query@multigpu-query-mem-usa=
ge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@xe_sriov_auto_provisioning@exclu=
sive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4273">Intel XE#4273</a>)</li>
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
PW_12861/shard-adlp-1/igt@core_hotunplug@hotreplug.html">PASS</a> +11 other=
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
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-1/igt@kms_async_flips@=
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
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-9/igt@kms_atomic_tr=
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
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_bw@connected-linear-t=
iling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464=
/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/sh=
ard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a=
-6.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_cursor_legacy@2x-long-flip-=
vs-cursor-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-legacy.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12861/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-leg=
acy.html">PASS</a></li>
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
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_cursor_leg=
acy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@=
kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PA=
SS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">In=
tel XE#4354</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12861/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-sst.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/sha=
rd-dg2-466/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-int=
erruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12861/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interrupt=
ible.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_flip@2x-flip=
-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +2 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#23=
16</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2861/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_f=
lip@2x-nonexisting-fb.html">PASS</a>) +2 other tests ( 2 pass )</li>
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
-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_flip@flip-vs-suspe=
nd-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12861/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptib=
le.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/204=
9">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_flip@flip-vs-suspend@b-=
hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-=
a-1-y-to-y.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-4/igt@kms_flip_tiling@=
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
ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-4/igt@kms_flip_tiling@flip-c=
hange-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuffer=
_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@km=
s_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">PASS</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress-n=
o-wait.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12861/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12861/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basi=
c-defer-mmap.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12861/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defe=
r-mmap.html">PASS</a>) +7 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-1/igt@xe_oa@buffer-size.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard=
-lnl-3/igt@xe_oa@buffer-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/s=
hard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/s=
hard-lnl-5/igt@xe_pm@s4-exec-after.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-1/igt@xe_pm@s4-exec-afte=
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
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-6/igt@kms_async_f=
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
.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp=
-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-c=
c@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_ccs@crc-pri=
mary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@km=
s_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787">Intel XE#787</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-=
d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_ccs@crc=
-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4=
 other tests skip</li>
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
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt=
@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/s=
hard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-=
hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-=
rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@crc=
-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
87">Intel XE#787</a>) +5 other tests skip</li>
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel =
XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4345">Intel XE#4345</a>)</li>
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">ABORT</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
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
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_ccs@ran=
dom-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_ccs@ra=
ndom-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>)</li>
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Inte=
l XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418=
">Intel XE#4418</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12861/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2861/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Int=
el XE#4418</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12861/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard=
-bmg-4/igt@kms_content_protection@atomic-dpms.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE=
#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12861/shard-bmg-4/igt@kms_content_protection@uevent.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa=
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
el-xe/IGTPW_12861/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2861/shard-dg2-466/igt@kms_display_modes@extended-mode-basic.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Int=
el XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@kms_flip@2x-plain-flip-ts-check-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/886">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12861/shard-dg2-435/igt@kms_flip@2x-plain-flip-ts-check-interr=
uptible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12861/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861=
/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a>) (<a=
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
rg/tree/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblan=
k@c-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12861/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html"=
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
e/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html">INCOM=
PLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861=
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
W_12861/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-5/i=
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
xe/IGTPW_12861/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861=
/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a>) (<a=
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
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-adlp-2/igt@kms_flip_s=
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
ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuffer_track=
ing@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_frontbuffe=
r_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_frontbuffer_trac=
king@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuf=
fer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel =
XE#656</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuffer_track=
ing@drrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontb=
uffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 ot=
her test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shr=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_track=
ing@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffe=
r_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2050">Intel XE#2050</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_tracking@f=
bc-rgb565-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-r=
gb565-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
1">Intel XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-i=
ndfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
6">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@km=
s_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Int=
el XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cu=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontb=
uffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 oth=
er tests skip</li>
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
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/653">Intel XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/656">Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-466/igt@kms_=
frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-463/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-7/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-436/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"=
>Intel XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-6/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-4/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_frontbuffer_trac=
king@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12861/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
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
el-xe/IGTPW_12861/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.ht=
ml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2861/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html">ABORT</a>=
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
.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-433/igt@kms_plane_scaling@intel=
-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-464/igt@kms_plane_scaling@in=
tel-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4502">Intel XE#4502</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-=
lnl-7/igt@kms_pm_dc@dc5-psr.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12861/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/71=
8">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12861/shard-bmg-5/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12861/shard-bmg-8/igt@kms_tiled_display@basic-test-p=
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
GTPW_12861/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-l=
nl-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#=
899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12861/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@=
pipe-b-edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12861/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-=
b-edp-1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-432/igt@xe_exec_b=
asic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-=
435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind=
.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8291/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/s=
hard-dg2-463/igt@xe_peer2peer@write.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12861/shard-dg2-435/igt@xe_peer2peer@wr=
ite.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8291 -&gt; IGTPW_12861</li>
<li>Linux: xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874 -&gt; xe-2865-4=
0517c3b252128d0a75e8d3fe86d88a04d1951bf</li>
</ul>
<p>IGTPW_12861: 12861<br />
  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874: 274d97eed4e8376b7a66b89=
04066baed6a1ae874<br />
  xe-2865-40517c3b252128d0a75e8d3fe86d88a04d1951bf: 40517c3b252128d0a75e8d3=
fe86d88a04d1951bf</p>

</body>
</html>

--===============1300819911833997616==--
