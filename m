Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB83C3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 06:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CBF10E2B3;
	Mon, 12 May 2025 06:47:32 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DE710E2B3;
 Mon, 12 May 2025 06:47:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4819065512805194181=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/kms=5Ftiled=5Fdispla?=
 =?utf-8?q?y=3A_Skip_if_connectors_are_not_of_same_type_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 12 May 2025 06:47:30 -0000
Message-ID: <174703245096.67652.9706908121086505564@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512044543.1230985-1-pranay.samala@intel.com>
In-Reply-To: <20250512044543.1230985-1-pranay.samala@intel.com>
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

--===============4819065512805194181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_tiled_display: Skip if connectors are not of same type (rev3)
URL   : https://patchwork.freedesktop.org/series/148468/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8361_FULL -> XEIGTPW_13108_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13108_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13108_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13108_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@xe_exec_basic@twice-null:
    - shard-lnl:          [PASS][3] -> [SKIP][4] +24 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_exec_basic@twice-null.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_exec_basic@twice-null.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     NOTRUN -> [ABORT][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-bmg:          NOTRUN -> [ABORT][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode1:
    - shard-bmg:          [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode1.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-lnl:          [SKIP][9] ([Intel XE#3768]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@kms_async_flips@invalid-async-flip-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-bmg:          [SKIP][11] ([Intel XE#3768]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-6/igt@kms_async_flips@invalid-async-flip-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          [SKIP][13] ([Intel XE#3278]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_content_protection@atomic-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_content_protection@atomic-dpms.html
    - shard-bmg:          [FAIL][15] ([Intel XE#1178]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          [SKIP][17] ([Intel XE#2320]) -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html
    - shard-lnl:          [SKIP][19] ([Intel XE#1424]) -> [SKIP][20] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          [SKIP][21] ([Intel XE#1421]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-7/igt@kms_flip@2x-flip-vs-modeset.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_flip@2x-flip-vs-modeset.html
    - shard-bmg:          [SKIP][23] ([Intel XE#2316]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][25] ([Intel XE#1729]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-lnl:          [SKIP][27] ([Intel XE#756]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@kms_writeback@writeback-invalid-parameters.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-lnl:          [SKIP][29] ([Intel XE#4837]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@xe_eudebug_online@set-breakpoint.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_pm@s3-basic-exec:
    - shard-lnl:          [SKIP][31] ([Intel XE#584]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_pm@s3-basic-exec.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_pm@s3-basic-exec.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13108_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#4208])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@core_getversion@basic.html

  * igt@fbdev@info:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#2134]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@fbdev@info.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#4208] / [Intel XE#4618])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-lnl:          [PASS][36] -> [FAIL][37] ([Intel XE#911]) +4 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1407]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#316]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1124]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1124]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1124]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#2351] / [Intel XE#4208]) +14 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2191])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2314] / [Intel XE#2894])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2191]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#367]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#367])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#367])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2887]) +8 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#3432])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#3432])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#787]) +167 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][56] ([Intel XE#3124])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#2887]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#4417]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#306])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2252]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#373]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#373]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2390])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][64] ([Intel XE#1178])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#3304])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#1178]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2320]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1424]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#308]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2291]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#309]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][73] -> [FAIL][74] ([Intel XE#4667])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4354])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#4331])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2373])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1135])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2316]) +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][81] -> [FAIL][82] ([Intel XE#3321]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][83] -> [INCOMPLETE][84] ([Intel XE#2049] / [Intel XE#2597])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1421])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [TIMEOUT][86] ([Intel XE#1504]) +1 other test timeout
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2231] / [Intel XE#4954]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [PASS][88] -> [SKIP][89] ([Intel XE#2351] / [Intel XE#4208]) +8 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2293] / [Intel XE#2380])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2293])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [FAIL][92] ([Intel XE#4683]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1401]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#455]) +12 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#651]) +19 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2311]) +10 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          [PASS][98] -> [SKIP][99] ([Intel XE#2351]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2312]) +7 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#4141]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#2351])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#651]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#653]) +14 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#656]) +12 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2313]) +7 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1503])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2393])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][109] -> [SKIP][110] ([Intel XE#4596])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#4596])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#2763]) +7 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2763]) +11 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2-set2:     [PASS][115] -> [SKIP][116] ([Intel XE#4208] / [i915#2575]) +85 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2938])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#718])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2392])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1129])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [PASS][122] -> [FAIL][123] ([Intel XE#4741])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_properties@get_properties-sanity-atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][124] ([Intel XE#5017])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@kms_properties@get_properties-sanity-atomic.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#1489]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1489]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#4608]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#2893]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1406]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#4609])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-6/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#4954])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1127])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#3414])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#4208] / [i915#2575]) +45 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#3414] / [Intel XE#3904])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][138] -> [SKIP][139] ([Intel XE#1435])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][140] ([Intel XE#4459]) +1 other test fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#1499])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1280] / [Intel XE#455])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#1123])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eudebug@basic-vm-access-parameters-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#4996]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_eudebug@basic-vm-access-parameters-faultable.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#4837]) +5 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#4837]) +11 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#4837]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-1/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#4518])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#688])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [PASS][151] -> [SKIP][152] ([Intel XE#4954]) +22 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1392]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2322]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][155] -> [SKIP][156] ([Intel XE#1392]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1392]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][158] -> [SKIP][159] ([Intel XE#4208]) +206 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#288]) +13 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#2360])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_system_allocator@once-mmap-mlock:
    - shard-bmg:          [PASS][162] -> [INCOMPLETE][163] ([Intel XE#2594])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-mlock.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-mlock.html

  * igt@xe_exec_system_allocator@process-many-mmap-huge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#4208]) +138 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_exec_system_allocator@process-many-mmap-huge.html

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#4943]) +11 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-new-bo-map:
    - shard-lnl:          [PASS][166] -> [SKIP][167] ([Intel XE#4996]) +22 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_exec_system_allocator@threads-many-stride-new-bo-map.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-stride-new-bo-map.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#4943]) +9 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#4915]) +109 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][170] -> [FAIL][171] ([Intel XE#4929])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:
    - shard-bmg:          [PASS][172] -> [SKIP][173] ([Intel XE#4996]) +20 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          NOTRUN -> [FAIL][174] ([Intel XE#5012])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199]) -> ([PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [SKIP][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225]) ([Intel XE#378])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_oa@stress-open-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#2541] / [Intel XE#3573])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_oa@stress-open-close.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-bmg:          [PASS][227] -> [SKIP][228] ([Intel XE#4954] / [Intel XE#4996]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-2/igt@xe_oa@syncs-syncobj-cfg.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][229] ([Intel XE#1337])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     NOTRUN -> [SKIP][230] ([Intel XE#1061] / [Intel XE#4208])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][231] ([Intel XE#2284] / [Intel XE#366])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          NOTRUN -> [SKIP][232] ([Intel XE#4650]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@xe_pmu@fn-engine-activity-load.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][233] ([Intel XE#4650])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#4733]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][235] ([Intel XE#4733])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][236] ([Intel XE#944]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][237] ([Intel XE#944])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#4821])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#4130]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#4273])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][241] ([Intel XE#4273])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][242] ([Intel XE#3342])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-lnl:          [SKIP][243] ([Intel XE#2134]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@fbdev@unaligned-write.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@fbdev@unaligned-write.html

  * igt@intel_sysfs_debugfs@xe-base:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#4208] / [Intel XE#4618]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@intel_sysfs_debugfs@xe-base.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@intel_sysfs_debugfs@xe-base.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#4208] / [i915#2575]) -> [PASS][248] +88 other tests pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_atomic@plane-invalid-params-fence.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][249] ([Intel XE#2351] / [Intel XE#4996]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][251] ([Intel XE#3862]) -> [PASS][252] +1 other test pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][253] ([Intel XE#2291]) -> [PASS][254] +2 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][255] ([Intel XE#1475]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][257] ([Intel XE#1340]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][259] ([Intel XE#4294]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][261] ([Intel XE#3321]) -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][263] ([Intel XE#2316]) -> [PASS][264] +12 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [FAIL][265] ([Intel XE#886]) -> [PASS][266] +2 other tests pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:
    - shard-bmg:          [FAIL][267] ([Intel XE#2882]) -> [PASS][268] +2 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][269] ([Intel XE#301]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][271] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][272] +1 other test pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][274] +8 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][275] ([Intel XE#1503]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][277] ([Intel XE#3012]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-lnl:          [SKIP][279] ([Intel XE#2351]) -> [PASS][280] +3 other tests pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_psr@fbc-psr-sprite-render.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-4/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#4208]) -> [PASS][282] +196 other tests pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1392]) -> [PASS][284] +5 other tests pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset:
    - shard-lnl:          [SKIP][285] ([Intel XE#4996]) -> [PASS][286] +10 other tests pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [FAIL][287] ([Intel XE#4208]) -> [PASS][288] +1 other test pass
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@many-reload.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][289] ([Intel XE#1794]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_spin_batch@spin-basic:
    - shard-lnl:          [SKIP][291] -> [PASS][292] +9 other tests pass
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_spin_batch@spin-basic.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-7/igt@xe_spin_batch@spin-basic.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#873]) -> [SKIP][294] ([Intel XE#4208] / [i915#2575])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#3768]) -> [SKIP][296] ([Intel XE#4208] / [i915#2575])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][297] ([Intel XE#2351]) -> [SKIP][298] ([Intel XE#3658])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#316]) -> [SKIP][300] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#4208]) -> [SKIP][302] ([Intel XE#316]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#316]) -> [SKIP][304] ([Intel XE#4208]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#1124]) -> [SKIP][306] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][308] ([Intel XE#1124]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#1124]) -> [SKIP][310] ([Intel XE#4208]) +7 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          [SKIP][311] ([Intel XE#1124]) -> [SKIP][312] ([Intel XE#2351] / [Intel XE#4996])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
    - shard-bmg:          [SKIP][313] ([Intel XE#1124]) -> [SKIP][314] ([Intel XE#2231] / [Intel XE#4996])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#4208]) -> [SKIP][316] ([Intel XE#610])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#4208]) -> [SKIP][318] ([Intel XE#1124]) +5 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2191]) -> [SKIP][320] ([Intel XE#4208] / [i915#2575])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#367]) -> [SKIP][322] ([Intel XE#4208] / [i915#2575])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#4208] / [i915#2575]) -> [SKIP][324] ([Intel XE#367]) +3 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][326] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][328] ([Intel XE#4208]) +16 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#4208]) -> [SKIP][330] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][332] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][333] ([Intel XE#2351]) -> [SKIP][334] ([Intel XE#2887])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2907]) -> [SKIP][336] ([Intel XE#4208])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][337] ([Intel XE#2887]) -> [SKIP][338] ([Intel XE#2231]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][339] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [DMESG-WARN][340] ([Intel XE#1727] / [Intel XE#3113])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][341] ([Intel XE#4212]) -> [SKIP][342] ([Intel XE#4208])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#4208]) -> [SKIP][344] ([Intel XE#2907]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-lnl:          [SKIP][345] ([Intel XE#2887]) -> [SKIP][346] ([Intel XE#2351]) +2 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#306]) -> [SKIP][348] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@kms_chamelium_color@gamma.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#4208] / [i915#2575]) -> [SKIP][350] ([Intel XE#373]) +10 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#373]) -> [SKIP][352] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#307]) -> [SKIP][354] ([Intel XE#4208] / [i915#2575])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][355] ([Intel XE#2341]) -> [FAIL][356] ([Intel XE#1178])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_content_protection@legacy.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [FAIL][357] ([Intel XE#1178]) -> [SKIP][358] ([Intel XE#4208] / [i915#2575])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_content_protection@legacy.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#308]) -> [SKIP][360] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#4208] / [i915#2575]) -> [SKIP][362] ([Intel XE#308])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x170.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          [SKIP][363] -> [SKIP][364] ([Intel XE#1424]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#4208] / [i915#2575]) -> [SKIP][366] ([Intel XE#323])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#323]) -> [SKIP][368] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][369] ([Intel XE#2351]) -> [SKIP][370] ([Intel XE#4354])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#4208]) -> [SKIP][372] ([Intel XE#4356])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_dp_link_training@uhbr-mst.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][374] ([Intel XE#455]) +2 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_dsc@dsc-with-formats.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#455]) -> [SKIP][376] ([Intel XE#4208]) +5 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#4208]) -> [SKIP][378] ([Intel XE#4422])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#776]) -> [SKIP][380] ([Intel XE#4208])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_fbcon_fbt@psr.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#701]) -> [SKIP][382] ([Intel XE#4208] / [i915#2575])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_feature_discovery@chamelium.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          [SKIP][383] -> [SKIP][384] ([Intel XE#703])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_feature_discovery@display-3x.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#4208] / [i915#2575]) -> [SKIP][386] ([Intel XE#703])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_feature_discovery@display-3x.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#1138]) -> [SKIP][388] ([Intel XE#4208] / [i915#2575])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [FAIL][389] ([Intel XE#2882]) -> [SKIP][390] ([Intel XE#2316])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][391] ([Intel XE#301]) -> [SKIP][392] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#455]) -> [SKIP][394] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][395] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][396] ([Intel XE#2231] / [Intel XE#4954])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
    - shard-lnl:          [SKIP][397] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][398] ([Intel XE#2351])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][399] ([Intel XE#2312]) -> [SKIP][400] ([Intel XE#2311]) +20 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-lnl:          [SKIP][401] ([Intel XE#2351]) -> [SKIP][402] ([Intel XE#656])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][403] ([Intel XE#2311]) -> [SKIP][404] ([Intel XE#2312]) +24 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][405] ([Intel XE#656]) -> [SKIP][406] ([Intel XE#2351]) +4 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][408] ([Intel XE#651]) +13 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][409] ([Intel XE#4141]) -> [SKIP][410] ([Intel XE#2231] / [Intel XE#4954])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          [SKIP][411] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][412] ([Intel XE#656])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][413] ([Intel XE#2312]) -> [SKIP][414] ([Intel XE#4141]) +7 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][415] ([Intel XE#4141]) -> [SKIP][416] ([Intel XE#2312]) +13 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][418] ([Intel XE#658])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][419] ([Intel XE#651]) -> [SKIP][420] ([Intel XE#2351])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][421] ([Intel XE#2311]) -> [SKIP][422] ([Intel XE#2231] / [Intel XE#4954]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#651]) -> [SKIP][424] ([Intel XE#4208]) +22 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#651]) -> [SKIP][426] ([Intel XE#2351] / [Intel XE#4208]) +9 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#4208]) -> [SKIP][428] ([Intel XE#651]) +15 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#4208]) -> [SKIP][430] ([Intel XE#653]) +24 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][431] ([Intel XE#2312]) -> [SKIP][432] ([Intel XE#2313]) +16 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][433] ([Intel XE#2313]) -> [SKIP][434] ([Intel XE#2312]) +19 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#653]) -> [SKIP][436] ([Intel XE#4208]) +24 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][438] ([Intel XE#653]) +3 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#653]) -> [SKIP][440] ([Intel XE#2351] / [Intel XE#4208]) +10 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][441] ([Intel XE#2312]) -> [SKIP][442] ([Intel XE#2231] / [Intel XE#4954]) +2 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][443] ([Intel XE#2313]) -> [SKIP][444] ([Intel XE#2231] / [Intel XE#4954])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#4208] / [i915#2575]) -> [SKIP][446] ([Intel XE#605])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#4208]) -> [SKIP][448] ([Intel XE#2925]) +1 other test skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#4298]) -> [SKIP][450] ([Intel XE#4208])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#4208]) -> [SKIP][452] ([Intel XE#2927])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#2925]) -> [SKIP][454] ([Intel XE#4208])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#356]) -> [SKIP][456] ([Intel XE#4208] / [i915#2575])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#4359]) -> [SKIP][458] ([Intel XE#4208])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          [SKIP][459] -> [SKIP][460] ([Intel XE#599])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][461] ([Intel XE#4596]) -> [SKIP][462] ([Intel XE#5021])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#5021]) -> [SKIP][464] ([Intel XE#4208] / [i915#2575])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#4208] / [i915#2575]) -> [SKIP][466] ([Intel XE#5020])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_plane_multiple@tiling-yf.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#4208] / [i915#2575]) -> [SKIP][468] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][470] ([Intel XE#4208] / [i915#2575])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#870]) -> [SKIP][472] ([Intel XE#4208]) +1 other test skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1122]) -> [SKIP][474] ([Intel XE#2351] / [Intel XE#4208])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          [SKIP][475] ([Intel XE#736]) -> [SKIP][476] ([Intel XE#1909])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#4208]) -> [SKIP][478] ([Intel XE#3309])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][480] ([Intel XE#908])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][481] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][482] ([Intel XE#4954])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#1489]) -> [SKIP][484] ([Intel XE#4208]) +6 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][485] ([Intel XE#1489]) -> [SKIP][486] ([Intel XE#2231] / [Intel XE#4954])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-lnl:          [SKIP][487] ([Intel XE#2893]) -> [SKIP][488] ([Intel XE#2351])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#4208]) -> [SKIP][490] ([Intel XE#1489]) +6 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1122]) -> [SKIP][492] ([Intel XE#4208]) +1 other test skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-lnl:          [SKIP][493] ([Intel XE#1406]) -> [SKIP][494] ([Intel XE#2351])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-render.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][496] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][498] ([Intel XE#4208]) +9 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#4208]) -> [SKIP][500] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][502] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_psr@pr-primary-page-flip.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          [SKIP][503] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][504] ([Intel XE#2231] / [Intel XE#4954]) +1 other test skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-8/igt@kms_psr@psr2-suspend.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][506] ([Intel XE#2939])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#3414]) -> [SKIP][508] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#4208] / [i915#2575]) -> [SKIP][510] ([Intel XE#3414])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          [SKIP][511] -> [SKIP][512] ([Intel XE#3414] / [Intel XE#3904])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#4208] / [i915#2575]) -> [SKIP][514] ([Intel XE#455]) +5 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_vrr@flip-dpms.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#455]) -> [SKIP][516] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@kms_vrr@flipline.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#4208] / [i915#2575]) -> [SKIP][518] ([Intel XE#756]) +1 other test skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#756]) -> [SKIP][520] ([Intel XE#4208] / [i915#2575])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][521] ([Intel XE#756]) -> [SKIP][522] ([Intel XE#4954])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@kms_writeback@writeback-invalid-parameters.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][524] ([Intel XE#4208]) +1 other test skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#4208]) -> [SKIP][526] ([Intel XE#1280] / [Intel XE#455])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#4208]) -> [SKIP][528] ([Intel XE#455]) +1 other test skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many-all-ram.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#4208]) -> [SKIP][530] ([Intel XE#1123]) +1 other test skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#4497]) -> [SKIP][532] ([Intel XE#4208])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_eu_stall@blocking-read.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#4208]) -> [SKIP][534] ([Intel XE#4497])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_eu_stall@invalid-sampling-rate.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eudebug@basic-vm-access-parameters-faultable:
    - shard-bmg:          [SKIP][535] ([Intel XE#4837]) -> [SKIP][536] ([Intel XE#4996])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-6/igt@xe_eudebug@basic-vm-access-parameters-faultable.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_eudebug@basic-vm-access-parameters-faultable.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-lnl:          [SKIP][537] -> [SKIP][538] ([Intel XE#4837])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#4208]) -> [SKIP][540] ([Intel XE#4837]) +10 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_eudebug@multiple-sessions.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#4837]) -> [SKIP][542] ([Intel XE#4208]) +13 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@xe_eudebug_online@preempt-breakpoint.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          [SKIP][543] ([Intel XE#4837]) -> [SKIP][544] ([Intel XE#4954])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#4518]) -> [SKIP][546] ([Intel XE#4208])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_eudebug_sriov@deny-eudebug.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#4208]) -> [SKIP][548] ([Intel XE#4518])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-lnl:          [SKIP][549] -> [SKIP][550] ([Intel XE#688])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-lnl:          [SKIP][551] -> [SKIP][552] ([Intel XE#1392]) +1 other test skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#1392]) -> [SKIP][554] ([Intel XE#4208])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#288]) -> [SKIP][556] ([Intel XE#4208]) +20 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch:
    - shard-dg2-set2:     [INCOMPLETE][557] ([Intel XE#2594]) -> [SKIP][558] ([Intel XE#288])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#4208]) -> [SKIP][560] ([Intel XE#288]) +21 other tests skip
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#2360]) -> [SKIP][562] ([Intel XE#4208]) +1 other test skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#4915]) -> [SKIP][564] ([Intel XE#4208]) +216 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@many-mmap-huge-nomemset:
    - shard-lnl:          [SKIP][565] ([Intel XE#4996]) -> [SKIP][566] ([Intel XE#4943])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-7/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#4208]) -> [SKIP][568] ([Intel XE#4915]) +181 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset:
    - shard-lnl:          [SKIP][569] ([Intel XE#4943]) -> [SKIP][570] ([Intel XE#4996]) +1 other test skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset.html
    - shard-bmg:          [SKIP][571] ([Intel XE#4943]) -> [SKIP][572] ([Intel XE#4996]) +1 other test skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#4208]) -> [SKIP][574] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][576] ([Intel XE#4208]) +4 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_oa@disabled-read-error.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][578] ([Intel XE#4208])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_oa@syncs-ufence-wait-cfg.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][579] ([Intel XE#4208]) -> [SKIP][580] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +3 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][581] ([Intel XE#4208]) -> [SKIP][582] ([Intel XE#977])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_pat@pat-index-xe2.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#4208]) -> [SKIP][584] ([Intel XE#2838] / [Intel XE#979])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          [SKIP][585] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][586] ([Intel XE#4996])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-6/igt@xe_pm@d3cold-basic.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_pm@d3cold-basic.html
    - shard-bmg:          [SKIP][587] ([Intel XE#2284]) -> [SKIP][588] ([Intel XE#4954] / [Intel XE#4996])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-8/igt@xe_pm@d3cold-basic.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#4208]) -> [SKIP][590] ([Intel XE#2284] / [Intel XE#366])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][592] ([Intel XE#4208]) +3 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#4208]) -> [SKIP][594] ([Intel XE#579])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][595] ([Intel XE#4650]) -> [SKIP][596] ([Intel XE#4208])
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@xe_pmu@all-fn-engine-activity-load.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-lnl:          [SKIP][597] -> [SKIP][598] ([Intel XE#4650])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#4208]) -> [SKIP][600] ([Intel XE#4650])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][601] -> [SKIP][602] ([Intel XE#4208])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_pmu@gt-frequency.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#4208]) -> [SKIP][604] ([Intel XE#4733]) +1 other test skip
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#4733]) -> [SKIP][606] ([Intel XE#4208]) +2 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#944]) -> [SKIP][608] ([Intel XE#4208]) +1 other test skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][609] ([Intel XE#4208]) -> [SKIP][610] ([Intel XE#944]) +1 other test skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#4208]) -> [SKIP][612] ([Intel XE#4814])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][613] ([Intel XE#4130]) -> [SKIP][614] ([Intel XE#4954] / [Intel XE#4996])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-dg2-set2:     [SKIP][615] ([Intel XE#4130]) -> [SKIP][616] ([Intel XE#4208]) +1 other test skip
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-lnl:          [SKIP][617] ([Intel XE#4130]) -> [SKIP][618] ([Intel XE#4996])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-lnl-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#4208]) -> [SKIP][620] ([Intel XE#4130])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#3342]) -> [SKIP][622] ([Intel XE#4208])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#4208]) -> [SKIP][624] ([Intel XE#4273])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_sriov_flr@flr-vfs-parallel.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#4351]) -> [SKIP][626] ([Intel XE#4208])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954
  [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
  [Intel XE#5012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012
  [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8361 -> IGTPW_13108

  IGTPW_13108: 13108
  IGT_8361: 8361
  xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cfefdb7aaef12cd80c9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/index.html

--===============4819065512805194181==
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
<tr><td><b>Series:</b></td><td>tests/kms_tiled_display: Skip if connectors =
are not of same type (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148468/">https://patchwork.freedesktop.org/series/148468/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13108/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13108/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8361_FULL -&gt; XEIGTPW_13108_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13108_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13108_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
108_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13108/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">SK=
IP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_exec_basic@twice-null.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/=
igt@xe_exec_basic@twice-null.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_fault_injection@probe-fail-=
guc-xe_guc_ct_send_recv.html">ABORT</a></li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-7/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_ct_send_recv.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode1=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine=
_class_video_decode1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_pmu@engine-activity-idle=
@engine-drm_xe_engine_class_video_decode1.html">FAIL</a> +1 other test fail=
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-2/igt@kms_async_flips@invalid-async-flip-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
68">Intel XE#3768</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13108/shard-lnl-3/igt@kms_async_flips@invalid-async-flip-atomi=
c.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-6/igt@kms_async_flips@invalid-async-flip-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
68">Intel XE#3768</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13108/shard-bmg-1/igt@kms_async_flips@invalid-async-flip-atomi=
c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_content_protection@atomic-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Int=
el XE#3278</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13108/shard-lnl-3/igt@kms_content_protection@atomic-dpms.html">SKIP</=
a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13108/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html">SKIP</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/232=
0">Intel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13108/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-max-size.=
html">SKIP</a> +1 other test skip</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/142=
4">Intel XE#1424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13108/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-max-size.=
html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-7/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1=
421</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3108/shard-lnl-3/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2=
316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3108/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13108/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html=
">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@kms_writeback@writeback-invalid-parameters.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
56">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13108/shard-lnl-3/igt@kms_writeback@writeback-invalid-parameter=
s.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-5/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel=
 XE#4837</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13108/shard-lnl-3/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard=
-lnl-3/igt@xe_pm@s3-basic-exec.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13108_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@core_getversion@basic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@fbdev@info.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#=
2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs=
-read-all-entries-display-off.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_async_flips@async-flip-with-p=
age-flip-events-linear-atomic.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +4 other tests fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_big_fb@y-tiled-64bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stri=
de-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@kms_bw@connected-linear-tiling=
-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_bw@linear-tiling-2-display=
s-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-ti=
led-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-=
tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +167 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe=
-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_chamelium_color@ctm-max.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resol=
ution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-for-e=
ach-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-6/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_content_protection@legacy@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_content_protection@srm.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_cursor_crc@cursor-random-256=
x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13108/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">=
Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-fli=
pb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_131=
08/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667">Intel =
XE#4667</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_dp_linktrain_fallback@dsc-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_feature_discovery@psr1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13108/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2316">Intel XE#2316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13108/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13108/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-4/igt@kms_flip@bo-too-big-interruptibl=
e@a-edp1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-x=
tile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-=
xtile-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp=
-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 other test fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp=
-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-=
2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-p=
lflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-=
bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13108/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_pm_backlight@brightness-wi=
th-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@k=
ms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">In=
tel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard=
-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4741">Intel XE#4741</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@kms_properties@get_properties-=
sanity-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5017">Intel XE#5017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-primary-p=
lane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt@edp=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-6/igt@kms_psr@psr-cursor-plane-onoff.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4954">Intel XE#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_rotation_crc@sprite-rotati=
on-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108=
/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1=
435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/44=
59">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-un=
bind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_compute_preempt@compute-pre=
empt-many@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-=
0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_eudebug@basic-vm-access-param=
eters-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4996">Intel XE#4996</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-4/igt@xe_eudebug@discovery-race-vmbind=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_eudebug@vm-bind-clear-fault=
able.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-1/igt@xe_eudebug@vma-ufence-faultable.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@xe_eudebug_sriov@deny-eudebug.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_evict@evict-beng-small-multi-=
vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defe=
r-mmap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13108/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-bas=
ic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4954">Intel XE#4954</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mma=
p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13108/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-m=
map.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@xe_exec_basic@once-userptr-invalidate-race.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13108/shard-dg2-464/igt@xe_exec_basic@once-userptr-invalidate-race.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +206 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_exec_fault_mode@twice-userp=
tr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-=
batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-mlock:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-mlock.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
108/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-mlock.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594=
">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_exec_system_allocator@proce=
ss-many-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +138 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_exec_system_allocator@process=
-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-bo-map:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@xe_exec_system_allocator@threads-many-stride-new=
-bo-map.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13108/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-st=
ride-new-bo-map.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4996">Intel XE#4996</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_exec_system_allocator@threads=
-shared-vm-many-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_exec_system_allocator@threa=
ds-shared-vm-many-large-malloc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +109 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-new-bo-map-nomemset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-7/igt@xe_exec_system_allocat=
or@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929">Intel XE#4929=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-=
stride-free-nomemset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-stride-free-nomemset.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +20 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_mmio_send_recv.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5012">Intel XE#5012</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8361/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-466/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8361/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-=
dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8361/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8361/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8361/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-43=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8361/shard-dg2-436/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_836=
1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-463/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8361/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-435/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8361/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8361/shard-dg2-434/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8361/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13108/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shar=
d-dg2-464/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13108/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13108/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2=
-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
108/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13108/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13108/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shar=
d-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13108/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_oa@stress-open-close.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-2/igt@xe_oa@syncs-syncobj-cfg.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/i=
gt@xe_oa@syncs-syncobj-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_pat@display-vs-wb-transient=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_peer2peer@write.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">I=
ntel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@xe_pmu@fn-engine-activity-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4650">Intel XE#4650</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_pmu@fn-engine-activity-load=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-bind-post-=
termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-8/igt@xe_query@multigpu-query-invalid-=
cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@xe_query@multigpu-query-invali=
d-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@xe_spin_batch@spin-mem-copy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_sriov_auto_provisioning@exc=
lusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273"=
>Intel XE#4273</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@xe_sriov_flr@flr-twice.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/427=
3">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_sriov_flr@flr-vf1-clear.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@fbdev@unaligned-write.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/s=
hard-lnl-3/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-base:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@intel_sysfs_debugfs@xe-base.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4618">Intel XE#4618</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13108/shard-dg2-434/igt@intel_sysfs_debugfs@xe-base.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_atomic@plane-invalid-params-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_atomic@plane-invalid-p=
arams-fence.html">PASS</a> +88 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-2/igt@kms_big_fb@4-tiled-add=
fb-size-offset-overflow.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3862">Intel XE#3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-dg2-mc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_cursor_lega=
cy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +2 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1475">Intel XE#1475</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13108/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-curs=
or-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel=
 XE#1340</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13108/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">=
Intel XE#4294</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13108/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ab-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13108/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</=
a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#88=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_131=
08/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">=
Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13108/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html">=
PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13108/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-6/igt@kms_flip@flip-vs-suspen=
d-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> +8 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel X=
E#1503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13108/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Inte=
l XE#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13108/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13108/shard-lnl-4/igt@kms_psr@fbc-psr-sprite-render.html">PASS</a> +3 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13108/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.ht=
ml">PASS</a> +196 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_exec_basi=
c@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> +5 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_exec_system_allocator@process-many-stride-mma=
p-shared-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-6/igt@xe_exec_system_a=
llocator@process-many-stride-mmap-shared-nomemset.html">PASS</a> +10 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_module_load@many-reload.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13108/shard-dg2-436/igt@xe_module_load@many-reload.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#17=
94</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
108/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_spin_batch@spin-basic.html">SKIP</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-7/=
igt@xe_spin_batch@spin-basic.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">In=
tel XE#873</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13108/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3768">Intel XE#3768</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_async_flips@invalid-async-flip-a=
tomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-18=
0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-8/igt@kms_big_fb@4-ti=
led-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Int=
el XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13108/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13108/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"=
>Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">I=
ntel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13108/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_big_fb@y-tiled-max-h=
w-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13108/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13108/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4996">Intel XE#4996</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13108/shard-bmg-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231=
">Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13108/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflo=
w.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate=
-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@kms_big_fb@yf-tile=
d-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840=
x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_bw@connected-linear-t=
iling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13108/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_bw@linear-tiling-=
3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_ccs@bad-aux-stride-=
4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tile=
d-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-=
y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13108/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl=
-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2907">Intel XE#2907</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-m=
tl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/sha=
rd-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4212">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13108/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">In=
tel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13108/shard-lnl-3/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">=
Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#30=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_131=
08/shard-dg2-464/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-466/igt@kms_chamelium_e=
did@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-ena=
bled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
07">Intel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13108/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_content_protection@legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13108/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#117=
8</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_content_protection@legacy.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel =
XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13108/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308=
">Intel XE#308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13108/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x170.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_cursor_crc@cursor-rando=
m-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKI=
P</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1310=
8/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE=
#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-curso=
r-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_curso=
r_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-curso=
r-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_cursor_legacy@short-b=
usy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13108/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#435=
4</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13108/shard-dg2-433/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE=
#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13108/shard-dg2-435/igt@kms_dsc@dsc-with-formats.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13108/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bp=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-differe=
nt-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_fbc_dirty_rect@fb=
c-dirty-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard=
-dg2-464/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_feature_discovery@chamelium.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel=
 XE#701</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13108/shard-dg2-464/igt@kms_feature_discovery@chamelium.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_feature_discovery@display-3x.html">SKIP</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shar=
d-lnl-8/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@kms_feature_discovery@display-3=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Int=
el XE#1138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13108/shard-dg2-464/igt@kms_feature_discovery@display-4x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13108/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-=
ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_flip_scal=
ed_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@k=
ms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">=
Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4954">Intel XE#4954</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@k=
ms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">=
Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-4/igt@kms_frontbuffer_tracking@=
drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_frontbuffer_trackin=
g@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-m=
map-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_frontbu=
ffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_frontbuffer_tracking=
@fbc-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-2/igt@kms_frontbuffer_tracking=
@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_frontbuffer_tracking@f=
bc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_frontbuffer_=
tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel=
 XE#4954</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-slo=
wdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-sp=
r-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_frontbuffer=
_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) =
+24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-3/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-5/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1=
9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-ti=
ling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt=
@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">I=
ntel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shr=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_frontbuffer_tra=
cking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel X=
E#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13108/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">I=
ntel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13108/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
25">Intel XE#2925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Inte=
l XE#4298</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13108/shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13108/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE=
#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-463/igt@kms_joiner@switch-modeset-ultra-joiner-big-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2925">Intel XE#2925</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_joiner@switch-modeset-ul=
tra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/356">Intel XE#356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-p=
ipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/435=
9">Intel XE#4359</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13108/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-=
8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel =
XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13108/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE=
#5021</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Inte=
l XE#5021</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13108/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_plane_multiple@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/50=
20">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-=
with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt=
@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">=
Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25=
-upscale-20x20.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_p=
lane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">In=
tel XE#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13108/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel=
 XE#1122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13108/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel =
XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE=
#736</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13108/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909">Intel XE#190=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13108/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE=
#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13108/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439"=
>Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_pm_rpm@modese=
t-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489=
">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13108/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-update-sf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13108/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-updat=
e-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2893">Intel XE#2893</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13108/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-updat=
e-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-p=
rimary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#=
1122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13108/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#=
1406</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13108/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">I=
ntel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13108/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
50">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel X=
E#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13108/shard-dg2-464/igt@kms_psr@pr-primary-page-flip.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-8/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13108/shard-bmg-1/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">In=
tel XE#4954</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-ov=
erlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@kms_psr_stre=
ss_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">In=
tel XE#3414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13108/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@kms_rotation_crc@primary-ro=
tation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/s=
hard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904"=
>Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13108/shard-dg2-436/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-=
dg2-464/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb21010=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@kms_writeback@w=
riteback-check-output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel X=
E#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13108/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@kms_writeback@writeback-invalid-parameters.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
56">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13108/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameter=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4954">Intel XE#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">I=
ntel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_compute_preempt@compute-pree=
mpt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13108/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-man=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many-all-ra=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_compute_preempt@compute-pre=
empt-many-all-ram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13108/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4=
497</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3108/shard-dg2-464/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_eu_stall@invalid-sampling-rate.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13108/shard-dg2-436/igt@xe_eu_stall@invalid-sampling-rate.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">=
Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-faultable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-6/igt@xe_eudebug@basic-vm-access-parameters-faultable.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_eudebug@basic-vm-access-paramet=
ers-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.ht=
ml">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13108/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13108/shard-dg2-433/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4=
837</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@xe_eudebug_online@preempt-breakpoint.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837"=
>Intel XE#4837</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13108/shard-dg2-464/igt@xe_eudebug_online@preempt-breakpoint.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel=
 XE#4837</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13108/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel =
XE#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel =
XE#4518</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13108/shard-dg2-464/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13108/shard-dg2-466/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#451=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-=
reopen.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13108/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-=
nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-n=
ull.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13108/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-=
vm-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
288">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13108/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-=
imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-=
prefetch.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-435/igt@xe_exec_fault_mod=
e@once-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13108/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-r=
ebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-=
fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2360">Intel XE#2360</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_exec_mix_modes@exec-sim=
ple-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-433/igt@xe_exec_system_allocator@many-large-malloc-nom=
emset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_exec_system_allocator@m=
any-large-malloc-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +216 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_exec_system_allocator@many-mmap-huge-nomemset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13108/shard-lnl-7/igt@xe_exec_system_allocator@many-mma=
p-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_exec_system_allocator@process-many-large-ex=
ecqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-434/igt@xe_exec_s=
ystem_allocator@process-many-large-execqueues-mmap-nomemset.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel=
 XE#4915</a>) +181 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-=
nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_ex=
ec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4996">Intel XE#4996</a>) +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_ex=
ec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4996">Intel XE#4996</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13108/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2=
541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
73">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13108/shard-dg2-464/igt@xe_oa@disabled-read-error.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE=
#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4501">Intel XE#4501</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_oa@syncs-ufence-wai=
t-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13108/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2=
541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
73">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4501">Intel XE#4501</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1310=
8/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1310=
8/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#=
979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-6/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel =
XE#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13108/shard-lnl-3/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-8/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shar=
d-bmg-1/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
108/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel=
 XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">=
Intel XE#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13108/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13108/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-463/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">I=
ntel XE#4650</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13108/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_131=
08/shard-lnl-2/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel =
XE#4650</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-466/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13108/shard-dg2-436/igt@xe_pmu@fn-engine-activity-sched-if-idl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@xe_pmu@gt-frequency.html">FAIL</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/i=
gt@xe_pmu@gt-frequency.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13108/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-434/igt@xe_pxp@pxp-termination-key-update-post-rpm.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4733">Intel XE#4733</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-p=
ost-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Inte=
l XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13108/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13108/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-versio=
n-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13108/shard-dg2-463/igt@xe_render_copy@render-stress-1-copies.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on=
-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-bmg-1/igt@xe_sriov_auto_provi=
sioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel X=
E#4996</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-435/igt@xe_sriov_auto_provisioning@resources-released-=
on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-463/igt@xe_sriov_auto_p=
rovisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) +1 other test skip</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-lnl-5/igt@xe_sriov_auto_provisioning@resources-released-on=
-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-lnl-3/igt@xe_sriov_auto_provi=
sioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovis=
ion-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13108/shard-dg2-432/igt@xe_sriov_aut=
o_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#41=
30</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Inte=
l XE#3342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13108/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-464/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13108/shard-dg2-435/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE=
#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8361/shard-dg2-436/igt@xe_sriov_scheduling@nonpreempt-engine-resets.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4351">Intel XE#4351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13108/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-en=
gine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8361 -&gt; IGTPW_13108</li>
</ul>
<p>IGTPW_13108: 13108<br />
  IGT_8361: 8361<br />
  xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cf=
efdb7aaef12cd80c9</p>

</body>
</html>

--===============4819065512805194181==--
