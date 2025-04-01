Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB31DC36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 16:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D57210E059;
	Tue,  1 Apr 2025 16:55:15 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2A910E059;
 Tue,  1 Apr 2025 16:55:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8537016369687705178=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Ffault=5Fi?=
 =?utf-8?q?njection=3A_Inject_fault_for_xe=5Fhw=5Fengine=5Fclass=5Fto=5Fstr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "replace_with Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 01 Apr 2025 16:55:14 -0000
Message-ID: <174352651448.24217.17207362826161093590@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401120657.1829327-1-sobin.thomas@intel.com>
In-Reply-To: <20250401120657.1829327-1-sobin.thomas@intel.com>
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

--===============8537016369687705178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Inject fault for xe_hw_engine_class_to_str
URL   : https://patchwork.freedesktop.org/series/147060/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8297_FULL -> XEIGTPW_12896_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12896_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12896_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12896_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on}:
    - shard-lnl:          [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-4/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12896_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#911]) +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#873])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-2/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#610])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#316]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-bmg:          [PASS][10] -> [INCOMPLETE][11] ([Intel XE#3225])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#316]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1428])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][15] ([Intel XE#4543]) +1 other test dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1467])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#2191])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2191]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2191]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#367]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +118 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#787]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +10 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#3442])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#3432]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#2907])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#4416]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#306])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#306]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-7/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#373])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#373]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#373]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#307])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#307])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#1178]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html
    - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1178])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-3/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][44] ([Intel XE#3304])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3278])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#455]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2321])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1424])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#309]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-dg2-set2:     [PASS][50] -> [SKIP][51] ([Intel XE#309]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#309]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2291]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#323])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#1340])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#4356]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#4294])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#455]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2244]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#776])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#703])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][64] -> [FAIL][65] ([Intel XE#3321]) +2 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [PASS][66] -> [INCOMPLETE][67] ([Intel XE#2049] / [Intel XE#2597])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][68] ([Intel XE#2049] / [Intel XE#2597])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a2-dp2.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#310]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#310]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1421]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2316]) +6 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#886]) +3 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         NOTRUN -> [FAIL][77] ([Intel XE#886]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][78] -> [DMESG-WARN][79] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1401]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1397] / [Intel XE#1745])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1397])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#651]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#651]) +10 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#656]) +16 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#651]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][88] -> [DMESG-FAIL][89] ([Intel XE#4543]) +10 other tests dmesg-fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][90] -> [SKIP][91] ([Intel XE#656]) +8 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#656]) +20 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#653]) +6 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#653]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1151])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1469])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#656])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][98] -> [SKIP][99] ([Intel XE#4328])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#2934])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#4090])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - shard-dg2-set2:     [PASS][102] -> [FAIL][103] ([Intel XE#4445])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-adlp:         [PASS][104] -> [DMESG-WARN][105] ([Intel XE#4173]) +6 other tests dmesg-warn
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][106] ([Intel XE#616]) +2 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_cursor@viewport:
    - shard-adlp:         [PASS][107] -> [FAIL][108] ([Intel XE#1471]) +1 other test fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@kms_plane_cursor@viewport.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#4596])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2493])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#2763]) +8 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#870])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          NOTRUN -> [FAIL][114] ([Intel XE#718])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#3309])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][116] ([Intel XE#1430])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1129])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][118] -> [SKIP][119] ([Intel XE#836])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#2893] / [Intel XE#4608])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#4608]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1489]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#2893]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1489])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1128])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1122])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1406])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#4609])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html

  * igt@kms_psr@psr-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@kms_psr@psr-cursor-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#3414] / [Intel XE#3904])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#1127])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1127])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1127])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2-set2:     [PASS][135] -> [SKIP][136] ([Intel XE#455])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1499])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_vrr@lobf.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1123])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#1126])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1062])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-1/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#2905]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#2905] / [Intel XE#3889])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#2905]) +9 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-3/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#2905]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#4577])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#4518])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-3/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#261] / [Intel XE#688])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#688]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#688])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#1392]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][151] -> [SKIP][152] ([Intel XE#1392]) +7 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#1392]) +5 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-2/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#288]) +12 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#288]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2360])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#2360])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#2229])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#378])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_module_load@force-load.html

  * igt@xe_oa@stress-open-close:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_oa@stress-open-close.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#2284])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#2284] / [Intel XE#366])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][164] -> [ABORT][165] ([Intel XE#1794])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-4/igt@xe_pm@s4-exec-after.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#944]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-6/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#944])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#4130])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][169] ([Intel XE#4543]) -> [PASS][170] +3 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][171] ([Intel XE#3908]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][173] ([Intel XE#4543]) -> [PASS][174] +9 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#2191]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][177] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][179] ([Intel XE#2291]) -> [PASS][180] +3 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#309]) -> [PASS][182] +5 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#3009]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_dp_aux_dev.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][185] ([Intel XE#4354]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#4354]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#310]) -> [PASS][190] +2 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][191] ([Intel XE#2316]) -> [PASS][192] +7 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         [FAIL][193] ([Intel XE#2882]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [FAIL][195] ([Intel XE#886]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][197] ([Intel XE#2049]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][199] ([Intel XE#324] / [Intel XE#4543]) -> [PASS][200] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-lnl:          [ABORT][201] -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#656]) -> [PASS][204] +7 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][205] ([Intel XE#3012]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#4328]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#4596]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][211] ([Intel XE#718]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-dg2-set2:     [INCOMPLETE][213] -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_rotation_crc@multiplane-rotation.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][215] ([Intel XE#1435]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#455]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][219] ([Intel XE#899]) -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][221] ([Intel XE#4459]) -> [PASS][222] +1 other test pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [FAIL][223] -> [PASS][224] +2 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1392]) -> [PASS][226] +6 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-adlp:         [DMESG-WARN][227] ([Intel XE#4173]) -> [PASS][228] +4 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][229] ([Intel XE#1794]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@xe_pm@s4-basic.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][232] ([Intel XE#787]) +9 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#787]) -> [SKIP][234] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][235] ([Intel XE#1178]) -> [SKIP][236] ([Intel XE#455])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
    - shard-bmg:          [FAIL][237] ([Intel XE#1178]) -> [SKIP][238] ([Intel XE#2341])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][239] ([Intel XE#2341]) -> [FAIL][240] ([Intel XE#1178])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_content_protection@legacy.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#455]) -> [FAIL][242] ([Intel XE#1178])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][243] ([Intel XE#301]) -> [SKIP][244] ([Intel XE#310]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][245] ([Intel XE#324] / [Intel XE#4543]) -> [DMESG-FAIL][246] ([Intel XE#4543]) +1 other test dmesg-fail
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][247] ([Intel XE#2312]) -> [SKIP][248] ([Intel XE#2311]) +15 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][249] ([Intel XE#4141]) -> [SKIP][250] ([Intel XE#2312]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][251] ([Intel XE#2312]) -> [SKIP][252] ([Intel XE#4141]) +10 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#656]) -> [SKIP][254] ([Intel XE#651]) +12 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#651]) -> [SKIP][256] ([Intel XE#656]) +14 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][257] ([Intel XE#2311]) -> [SKIP][258] ([Intel XE#2312]) +11 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][259] ([Intel XE#2313]) -> [SKIP][260] ([Intel XE#2312]) +10 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][261] ([Intel XE#2312]) -> [SKIP][262] ([Intel XE#2313]) +13 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#653]) -> [SKIP][264] ([Intel XE#656]) +16 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#656]) -> [SKIP][266] ([Intel XE#653]) +15 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][267] ([Intel XE#2893]) -> [SKIP][268] ([Intel XE#2893] / [Intel XE#4608]) +10 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][269] ([Intel XE#2426]) -> [SKIP][270] ([Intel XE#2509])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1500]) -> [SKIP][272] ([Intel XE#362])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][273] ([Intel XE#899]) -> [FAIL][274] ([Intel XE#771]) +1 other test fail
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][275], [SKIP][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [DMESG-WARN][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300]) ([Intel XE#378] / [Intel XE#4173]) -> ([PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [SKIP][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326]) ([Intel XE#378])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-4/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-2/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-1/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-4/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-4/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-4/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-1/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-1/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-1/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-8/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-2/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-2/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-2/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-8/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-4/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-8/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-8/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-2/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4445
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8297 -> IGTPW_12896
  * Linux: xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201 -> xe-2889-9368766ece6c78cc0001f9b53037563fe521f887

  IGTPW_12896: 12896
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9180336b156148e201
  xe-2889-9368766ece6c78cc0001f9b53037563fe521f887: 9368766ece6c78cc0001f9b53037563fe521f887

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/index.html

--===============8537016369687705178==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Inject fault=
 for xe_hw_engine_class_to_str</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147060/">https://patchwork.freedesktop.org/series/147060/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12896/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12896/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8297_FULL -&gt; XEIGTPW_12896_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12896_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12896_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
896_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-4:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr2=
4@pipe-b-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-s=
anitycheck-xr24@pipe-b-dp-4.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on}:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-4/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-=
display-on.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12896/shard-lnl-5/igt@intel_sysfs_debugfs@xe-debugfs-read-a=
ll-entries-display-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12896_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12896/shard-lnl-1/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-2/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/s=
hard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE=
#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1407">Intel XE#1407</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 oth=
er test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
67">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560=
x1440p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12896/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-466/igt@kms_bw@connected-linear-tiling=
-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays=
-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled=
-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +118 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tile=
d-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled=
-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-=
gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@kms_chamelium_color@ctm-0-25.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-7/igt@kms_chamelium_color@ctm-negative=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_chamelium_frames@hdmi-aspe=
ct-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm-=
disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
3">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_content_protection@dp-mst-=
type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_content_protection@legacy@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-bmg-3/igt@kms_content_protection@legacy@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_cursor_crc@cursor-random-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-64=
x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_cursor_legacy@2x-flip-vs-cu=
rsor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12896/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
9">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-3/igt@kms_cursor_legacy@2x-long-cursor=
-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2896/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@kms_cursor_legacy@short-busy-fl=
ip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shar=
d-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_dp_link_training@uhbr-sst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4356">Intel XE#4356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-6/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_dsc@dsc-with-output-format=
s-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@kms_fbcon_fbt@psr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
76">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_feature_discovery@display-3=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-d=
g2-432/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel =
XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@ad=
-hdmi-a2-dp2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@2x-nonexisting-fb-interruptible.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12896/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">I=
ntel XE#310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@kms_flip@2x-plain-flip.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310"=
>Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-7/igt@kms_flip@2x-plain-flip-fb-recrea=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12896/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl=
-4/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vb=
lank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
96/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">=
Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#14=
01</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1=
p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-sh=
rfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12896/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-of=
fscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +10 other test=
s dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +20 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/s=
hard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-3/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-7/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr2=
4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12896/shard-dg2-433/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-x=
r24.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4445">Intel XE#4445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12896/shard-adlp-1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4173">Intel XE#4173</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp=
-1/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_plane_scaling@plane-downsca=
le-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@kms_pm_backlight@basic-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel=
 XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-1/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Inte=
l XE#1430</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">In=
tel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-=
464/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-plane-move=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@kms_psr2_sf@pr-plane-move-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2893">Intel XE#2893</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1128">Intel XE#1128</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb88=
88.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_psr@fbc-psr2-no-drrs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_psr@fbc-psr2-no-drrs@edp-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@kms_psr@psr-cursor-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@kms_rotation_crc@primary-4-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
96/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#=
1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0=
xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-1/igt@xe_create@create-big-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
62">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_eudebug@attach-debug-metadat=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence=
-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-3/igt@xe_eudebug@discovery-empty-clien=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-433/igt@xe_eudebug_online@interrupt-al=
l-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-3/igt@xe_eudebug_sriov@deny-sriov.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@xe_evict@evict-beng-small-multi=
-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-pa=
rallel-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-s=
tandalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-=
bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12896/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1392">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-2/igt@xe_exec_basic@multigpu-once-user=
ptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexe=
cqueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@xe_exec_fault_mode@twice-userp=
tr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-=
batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinner-=
interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_live_ktest@xe_bo.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">I=
ntel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_live_ktest@xe_bo@xe_ccs_migr=
ate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_module_load@force-load.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
78">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_oa@stress-open-close.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/254=
1">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@xe_pm@d3cold-mocs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@xe_pm@s4-d3cold-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-4/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt=
@xe_pm@s4-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-6/igt@xe_query@multigpu-query-invalid-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@xe_query@multigpu-query-oa-unit=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfc=
onfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-event=
s.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@kms_async_flips@async-fli=
p-with-page-flip-events.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-fencing.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@kms_atomic_transition=
@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-1=
80-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@kms_big_fb@y-=
tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +9 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_bw@connected-linear-t=
iling-2-displays-2160x1440p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-8/igt@kms_bw@connecte=
d-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-2/igt@kms_cursor_lega=
cy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +3 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12896/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-varying-size.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-=
dg2-433/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Inte=
l XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12896/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>=
</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">In=
tel XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12896/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/310">Intel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race-in=
terruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12896/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</=
a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_v=
blank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">I=
ntel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12896/shard-dg2-435/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2049">Intel XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblan=
k@a-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-y=
tile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
96/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-dow=
nscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-ind=
fb-draw-render.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-=
offscren-pri-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12896/shard-dg2-466/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Inte=
l XE#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12896/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4328">Intel XE#4328</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-b=
ig-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">In=
tel XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12896/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-none.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-=
lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_rotation_crc@multiplane-rotation.html">INC=
OMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12896/shard-dg2-464/igt@kms_rotation_crc@multiplane-rotation.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12896/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">=
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
ee/intel-xe/IGTPW_12896/shard-dg2-433/igt@kms_setmode@invalid-clone-single-=
crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#445=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
96/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html">FA=
IL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
96/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mma=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec=
-basic-defer-mmap.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-=
xe_uc_fw_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@xe_fault_inje=
ction@inject-fault-probe-function-xe_uc_fw_init.html">PASS</a> +4 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-=
adlp-1/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-h=
dmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-466/igt@kms_ccs@ccs-on=
-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">I=
ntel XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12896/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12896/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">In=
tel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_content_protection@legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12896/shard-bmg-3/igt@kms_content_protection@legacy.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12896/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-x=
tile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/ig=
t@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-3/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-4/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) =
+10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-435/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-i=
ndfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1=
0 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12896/shard-bmg-7/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-i=
ndfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-dg2-432/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-lnl-5/igt@kms_psr2_sf@fbc-=
psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608"=
>Intel XE#4608</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12896/shard-bmg-1/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12896/shard-dg2-463/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Inte=
l XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12896/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel=
 XE#771</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8297/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-2/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGT_8297/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8297/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGT_8297/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_829=
7/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8297/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8297/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGT_8297/shard-adlp-6/igt@xe_module_load@load.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8297/shard-adlp-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-a=
dlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/sh=
ard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-8/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_82=
97/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-2/igt@xe_module_load@=
load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/378">Intel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12896/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adl=
p-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1289=
6/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12896/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12896/shard-adlp-6/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-=
adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2896/shard-adlp-9/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-9/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12896/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard=
-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12896/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12896/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shard-adlp-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12896/shard-adlp-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12896/shar=
d-adlp-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8297 -&gt; IGTPW_12896</li>
<li>Linux: xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201 -&gt; xe-2889-9=
368766ece6c78cc0001f9b53037563fe521f887</li>
</ul>
<p>IGTPW_12896: 12896<br />
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9=
180336b156148e201<br />
  xe-2889-9368766ece6c78cc0001f9b53037563fe521f887: 9368766ece6c78cc0001f9b=
53037563fe521f887</p>

</body>
</html>

--===============8537016369687705178==--
