Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1612C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 14:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2221A10E0EF;
	Sun,  6 Apr 2025 14:56:02 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9A610E0DA;
 Sun,  6 Apr 2025 14:56:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7135306931905105230=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_lib/dsc=3A_use_intel=5Fdis?=
 =?utf-8?q?play=5Fcaps_instead_of_i915=5Fdisplay=5Fcapabilities?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 14:56:00 -0000
Message-ID: <174395136042.40993.9009151288705463160@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250325130842.1821042-1-jani.nikula@intel.com>
In-Reply-To: <20250325130842.1821042-1-jani.nikula@intel.com>
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

--===============7135306931905105230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/dsc: use intel_display_caps instead of i915_display_capabilities
URL   : https://patchwork.freedesktop.org/series/146736/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8284_FULL -> XEIGTPW_12829_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12829_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12829_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12829_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6.html

  
#### Warnings ####

  * igt@kms_color@deep-color@pipe-a-dp-2-degamma:
    - shard-bmg:          [INCOMPLETE][2] -> ([PASS][3], [INCOMPLETE][4])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-2/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-1/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][5] ([Intel XE#1178]) -> ([FAIL][6], [INCOMPLETE][7]) ([Intel XE#1178]) +1 other test ( 1 fail, 1 incomplete )
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-4/igt@kms_content_protection@legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_content_protection@legacy.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_content_protection@legacy.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [INCOMPLETE][8] -> ([PASS][9], [INCOMPLETE][10])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-180.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-180.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:
    - shard-dg2-set2:     [ABORT][11] -> ([PASS][12], [ABORT][13])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-464/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12829_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [PASS][14] -> ([FAIL][15], [PASS][16]) ([Intel XE#3719] / [Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][17] -> ([PASS][18], [FAIL][19]) ([Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#316]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1407])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2327]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#607])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1124]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][27] -> ([SKIP][28], [PASS][29]) ([Intel XE#2314] / [Intel XE#2894])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2191]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#367])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#367])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#367])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1512])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2669]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2887])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#3432])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#787]) +236 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#2907]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#455] / [Intel XE#787]) +49 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][43] ([Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#306])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#306])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2252])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#373]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#373]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][49] ([Intel XE#1178])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#1178])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#307]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#3278])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#1188])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1424])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#308])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][56] ([Intel XE#2932]) +1 other test dmesg-warn
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#309])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#309])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][59] -> ([SKIP][60], [PASS][61]) ([Intel XE#309])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][62] -> ([PASS][63], [SKIP][64]) ([Intel XE#2291]) +5 other tests ( 1 pass, 1 skip )
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#323])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2286])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1508])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([i915#3804])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [PASS][69] -> ([SKIP][70], [PASS][71]) ([Intel XE#4331])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-463/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2244])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1421]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][74] -> ([PASS][75], [FAIL][76]) ([Intel XE#3321]) +2 other tests ( 1 fail, 1 pass )
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#310])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2316])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2-set2:     [PASS][79] -> ([SKIP][80], [PASS][81]) ([Intel XE#310]) +2 other tests ( 1 pass, 1 skip )
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-432/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][82] -> ([SKIP][83], [PASS][84]) ([Intel XE#2316]) +7 other tests ( 1 pass, 1 skip )
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [FAIL][85] ([Intel XE#886]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][86] ([Intel XE#3321]) +2 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          [PASS][87] -> ([FAIL][88], [PASS][89]) ([Intel XE#886]) +2 other tests ( 1 fail, 1 pass )
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2:
    - shard-dg2-set2:     [PASS][90] -> ([PASS][91], [FAIL][92]) ([Intel XE#2882]) +3 other tests ( 1 fail, 1 pass )
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1401]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2293]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#455]) +7 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#352])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2311]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#651]) +7 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][101] -> ([SKIP][102], [PASS][103]) ([Intel XE#656]) +3 other tests ( 1 pass, 1 skip )
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#656])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#4141])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#651]) +18 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#656]) +18 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2312])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2313]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#653]) +19 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1503])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_hdr@static-swap.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#4329])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [PASS][113] -> ([INCOMPLETE][114], [PASS][115]) ([Intel XE#1035]) +1 other test ( 1 incomplete, 1 pass )
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [PASS][116] -> ([FAIL][117], [PASS][118]) ([Intel XE#616])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-463/igt@kms_plane_cursor@overlay.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_plane_cursor@overlay.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][119] ([Intel XE#616])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][120] -> ([PASS][121], [SKIP][122]) ([Intel XE#2571])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#3307])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2763]) +11 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1489]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][126] ([Intel XE#4570]) +5 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2893])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#1489])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1128])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [FAIL][130] ([Intel XE#4568]) +1 other test fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1406]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-7/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1127])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#3414]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#3414] / [Intel XE#3904])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2168])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1499])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#1091] / [Intel XE#2849])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1091] / [Intel XE#2849])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1447])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1123])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#4497])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-connect:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2905])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#2905]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2905]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#4518])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#688]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#1392]) +5 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2322])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [PASS][152] -> ([PASS][153], [SKIP][154]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#1392])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#288]) +13 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181]) -> ([PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [SKIP][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226]) ([Intel XE#378])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-1/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-6/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-5/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-2/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-2/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-1/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-3/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-4/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-4/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-4/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-3/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-8/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-5/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-8/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-4/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-6/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-3/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-5/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-7/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-7/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-7/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-6/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-8/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-1/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-7/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-2/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-2/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-8/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-8/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-7/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-7/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-7/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-2/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-2/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-7/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-7/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-8/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-8/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-8/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-size:
    - shard-bmg:          [PASS][227] -> ([FAIL][228], [PASS][229]) ([Intel XE#4541])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-8/igt@xe_oa@buffer-size.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@xe_oa@buffer-size.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@xe_oa@buffer-size.html

  * igt@xe_oa@buffer-size@rcs-0-128k:
    - shard-bmg:          NOTRUN -> [FAIL][230] ([Intel XE#4541])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@xe_oa@buffer-size@rcs-0-128k.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][232] ([Intel XE#1948])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#584]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-2/igt@xe_pm@s3-mocs.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#944])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-lnl:          NOTRUN -> [SKIP][235] ([Intel XE#944])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-lnl:          NOTRUN -> [SKIP][236] ([Intel XE#4130])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#3342])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#4351])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@xe_sriov_scheduling@equal-throughput.html
    - shard-lnl:          NOTRUN -> [SKIP][239] ([Intel XE#4351])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][240] -> ([PASS][241], [ABORT][242]) ([Intel XE#3084])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#787]) -> ([SKIP][244], [SKIP][245]) ([Intel XE#455] / [Intel XE#787]) +2 other tests ( 2 skip )
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][246] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> ([INCOMPLETE][247], [INCOMPLETE][248]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][249] ([Intel XE#1727] / [Intel XE#3113]) -> ([PASS][250], [INCOMPLETE][251]) ([Intel XE#1727] / [Intel XE#3113])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#4440]) -> ([SKIP][253], [SKIP][254]) ([Intel XE#4418] / [Intel XE#4440])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [INCOMPLETE][255] ([Intel XE#4346]) -> ([PASS][256], [INCOMPLETE][257]) ([Intel XE#4346])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-2/igt@kms_color@deep-color.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-1/igt@kms_color@deep-color.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][258] ([Intel XE#2341]) -> ([SKIP][259], [FAIL][260]) ([Intel XE#1178] / [Intel XE#2341])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-6/igt@kms_content_protection@atomic.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-6/igt@kms_content_protection@atomic.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#455]) -> ([SKIP][262], [FAIL][263]) ([Intel XE#1188] / [Intel XE#455])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-464/igt@kms_content_protection@uevent.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_content_protection@uevent.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#309]) -> ([SKIP][265], [PASS][266]) ([Intel XE#309]) +2 other tests ( 1 pass, 1 skip )
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][267] ([Intel XE#2291]) -> ([PASS][268], [SKIP][269]) ([Intel XE#2291]) +4 other tests ( 1 pass, 1 skip )
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][270] ([Intel XE#4302]) -> ([SKIP][271], [PASS][272]) ([Intel XE#4302])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#310]) -> ([SKIP][274], [PASS][275]) ([Intel XE#310]) +5 other tests ( 1 pass, 1 skip )
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][276] ([Intel XE#2316]) -> ([SKIP][277], [FAIL][278]) ([Intel XE#2316] / [Intel XE#3321])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][279] ([Intel XE#301]) -> ([FAIL][280], [PASS][281]) ([Intel XE#301])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][282] ([Intel XE#3321]) -> ([PASS][283], [FAIL][284]) ([Intel XE#3321]) +3 other tests ( 1 fail, 1 pass )
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][285] ([Intel XE#2316]) -> ([SKIP][286], [PASS][287]) ([Intel XE#2316]) +3 other tests ( 1 pass, 1 skip )
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][288] ([Intel XE#301]) -> ([FAIL][289], [PASS][290]) ([Intel XE#301])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][291] ([Intel XE#2312]) -> ([SKIP][292], [SKIP][293]) ([Intel XE#2311] / [Intel XE#2312]) +14 other tests ( 2 skip )
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][294] ([Intel XE#2311]) -> ([SKIP][295], [SKIP][296]) ([Intel XE#2311] / [Intel XE#2312]) +13 other tests ( 2 skip )
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#656]) -> ([SKIP][298], [SKIP][299]) ([Intel XE#651] / [Intel XE#656]) +10 other tests ( 2 skip )
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#651]) -> ([SKIP][301], [SKIP][302]) ([Intel XE#651] / [Intel XE#656]) +6 other tests ( 2 skip )
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][303] ([Intel XE#4141]) -> ([SKIP][304], [SKIP][305]) ([Intel XE#2312] / [Intel XE#4141]) +8 other tests ( 2 skip )
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#656]) -> ([PASS][307], [SKIP][308]) ([Intel XE#656]) +7 other tests ( 1 pass, 1 skip )
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][309] ([Intel XE#2312]) -> ([SKIP][310], [SKIP][311]) ([Intel XE#2312] / [Intel XE#4141]) +7 other tests ( 2 skip )
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#653]) -> ([SKIP][313], [SKIP][314]) ([Intel XE#653] / [Intel XE#656]) +5 other tests ( 2 skip )
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][315] ([Intel XE#2312]) -> ([SKIP][316], [SKIP][317]) ([Intel XE#2312] / [Intel XE#2313]) +10 other tests ( 2 skip )
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][318] ([Intel XE#2313]) -> ([SKIP][319], [SKIP][320]) ([Intel XE#2312] / [Intel XE#2313]) +14 other tests ( 2 skip )
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#656]) -> ([SKIP][322], [SKIP][323]) ([Intel XE#653] / [Intel XE#656]) +13 other tests ( 2 skip )
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#4328]) -> ([PASS][325], [SKIP][326]) ([Intel XE#4328])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#362]) -> ([SKIP][328], [SKIP][329]) ([Intel XE#1500] / [Intel XE#362])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][330] ([Intel XE#899]) -> ([FAIL][331], [FAIL][332]) ([Intel XE#771] / [Intel XE#899]) +3 other tests ( 2 fail )
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][333] ([Intel XE#4459]) -> ([FAIL][334], [PASS][335]) ([Intel XE#4459]) +1 other test ( 1 fail, 1 pass )
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#1392]) -> ([SKIP][337], [PASS][338]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4346
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568
  [Intel XE#4570]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8284 -> IGTPW_12829

  IGTPW_12829: 12829
  IGT_8284: 8284
  xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/index.html

--===============7135306931905105230==
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
<tr><td><b>Series:</b></td><td>lib/dsc: use intel_display_caps instead of i=
915_display_capabilities</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146736/">https://patchwork.freedesktop.org/series/146736/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12829/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12829/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8284_FULL -&gt; XEIGTPW_12829_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12829_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12829_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
829_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_flip@flip-vs-absolute-wf_v=
blank-interruptible@a-hdmi-a6.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-2-degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-2/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html">I=
NCOMPLETE</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12829/shard-bmg-1/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/s=
hard-bmg-2/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html">INCOMPLETE</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-4/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12829/shard-bmg-4/igt@kms_content_protection@legacy.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt=
@kms_content_protection@legacy.html">INCOMPLETE</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other=
 test ( 1 fail, 1 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-180.html">INC=
OMPLETE</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12829/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-180.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard=
-dg2-433/igt@kms_rotation_crc@sprite-rotation-180.html">INCOMPLETE</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exe=
c_queue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-464/igt@xe_fault_injection@exec-queue-create-fail-xe_h=
w_engine_group_add_exec_queue.html">ABORT</a> -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@xe_fault_injec=
tion@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-d=
g2-464/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add=
_exec_queue.html">ABORT</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12829_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12829/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-fl=
ip-events-atomic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_async_flips@async-flip-with-page=
-flip-events-atomic.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other test=
s ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_async_flips@async-flip=
-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_async_=
flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel =
XE#911</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12829/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-=
2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12829/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-=
2560x1440p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_bw@connected-linear-tiling=
-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_bw@linear-tiling-3-display=
s-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-=
bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-tile=
d-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-=
tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +236 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-t=
iled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +49 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">In=
tel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_chamelium_color@ctm-blue-t=
o-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-2/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_chamelium_edid@dp-mode-timin=
gs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_chamelium_edid@hdmi-mode-tim=
ings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
73">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_content_protection@atomic@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_content_protection@dp-mst-=
lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_content_protection@uevent@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_cursor_crc@cursor-random-256=
x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_cursor_crc@cursor-suspend.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2932">Intel XE#2932</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor=
-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-f=
lipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tran=
sitions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_cursor_legacy@cursor=
a-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel =
XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions-varying-size.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_cursor_leg=
acy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>) +5 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-6/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6b=
pc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-463/igt@kms_dp_linktrain_fallback@dp-fallback.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
829/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2=
-463/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Inte=
l XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a=
3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12829/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdm=
i-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12829/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a=
3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321">Intel XE#3321</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-432/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829=
/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/i=
gt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other =
tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12829/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12829/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2316">Intel XE#2316</a>) +7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vbl=
ank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@=
a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@b-edp1.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/=
shard-lnl-3/igt@kms_flip@plain-flip-ts-check@b-edp1.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@k=
ms_flip@plain-flip-ts-check@b-edp1.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tes=
ts ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hd=
mi-a2.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12829/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check-interruptib=
le@a-hdmi-a2.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12829/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check-interrupti=
ble@a-hdmi-a2.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2882">Intel XE#2882</a>) +3 other tests ( 1 fail, 1 pass=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#23=
80</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp=
-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_force_connector_basic@force-=
edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb=
-plflip-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-shrfb-plflip-blt.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests =
( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_hdr@static-swap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
29/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard=
-bmg-8/igt@kms_plane@pixel-format-source-clamping.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035=
</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-463/igt@kms_plane_cursor@overlay.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2=
-432/igt@kms_plane_cursor@overlay.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_plane_cursor@=
overlay.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-=
a-hdmi-a-2-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
29/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4=
/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4570">Intel XE#4570</a>) +5 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move=
-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-mo=
ve.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4568">Intel XE#4568</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-7/igt@kms_psr@pr-sprite-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_rotation_crc@sprite-rotati=
on-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel X=
E#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"=
>Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-un=
bind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-7/igt@xe_compute@ccs-mode-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
47">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@xe_compute_preempt@compute-pre=
empt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-=
0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@xe_eu_stall@blocking-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@xe_eudebug@basic-connect.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_eudebug_online@debugger-reope=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@xe_eudebug_online@interrupt-al=
l-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_eudebug_sriov@deny-eudebug.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-st=
andalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-rebind.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12829/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829=
/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">In=
tel XE#1392</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec=
-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind=
-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8284/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8284/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8284/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8284/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8284/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8284/shard-lnl-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-ln=
l-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8284/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard=
-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/sh=
ard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
284/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8284/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8284/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12829/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/s=
hard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12829/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12829/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-l=
nl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1282=
9/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12829/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12829/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shar=
d-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2829/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-7/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12829/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12829/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-ln=
l-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12829/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12829/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard=
-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
829/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12829/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/sh=
ard-lnl-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-8/igt@xe_oa@buffer-size.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@x=
e_oa@buffer-size.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12829/shard-bmg-8/igt@xe_oa@buffer-size.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel X=
E#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@rcs-0-128k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@xe_oa@buffer-size@rcs-0-128k.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@xe_oa@whitelisted-registers-us=
erspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">=
Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-2/igt@xe_pm@s3-mocs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#=
584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@xe_query@multigpu-query-invali=
d-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-5/igt@xe_query@multigpu-query-invalid-=
extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfc=
onfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-1/igt@xe_sriov_flr@flr-each-isolation.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@xe_sriov_scheduling@equal-thro=
ughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4351">Intel XE#4351</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_sriov_scheduling@equal-throug=
hput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-lnl-8/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-l=
nl-8/igt@xe_wedged@wedged-mode-toggle.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-4/igt@xe_wedged@wedge=
d-mode-toggle.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-=
hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12829/shard-dg2-435/igt@kms_ccs@missing-ccs-buff=
er-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_ccs@missing-ccs-=
buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"=
>Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_ccs@ran=
dom-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440=
">Intel XE#4440</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12829/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2829/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Int=
el XE#4418</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-2/igt@kms_color@deep-color.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4346">Intel XE#43=
46</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2829/shard-bmg-1/igt@kms_color@deep-color.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_color@d=
eep-color.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4346">Intel XE#4346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12829/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt=
@kms_content_protection@atomic.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12829/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433=
/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-=
atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12829/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/309">Intel XE#309</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-le=
gacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12829/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2291">Intel XE#2291</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">=
Intel XE#4302</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12829/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829=
/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#=
4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-i=
nterruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12829/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race-interr=
uptible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/310">Intel XE#310</a>) +5 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-i=
nterruptible.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12829/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vbl=
ank@ac-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12829/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank=
@ac-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests ( 1 fail, 1 pa=
ss )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
29/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_flip@2x=
-plain-flip.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests ( 1 pass, 1 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12829/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829=
/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-6/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312">Intel XE#2312</a>) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuffer=
_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@km=
s_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
141">Intel XE#4141</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-463/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_=
frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel =
XE#656</a>) +7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-8/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-6/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-432/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/653">Intel XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/656">Intel XE#656</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-1/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-2/igt@kms_frontbuffer_trackin=
g@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">In=
tel XE#4328</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12829/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/sha=
rd-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/362">Intel XE#362</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12829/shard-dg2-464/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12829/shard-dg2-433/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@=
pipe-a-edp-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12829/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-=
a-edp-1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/771">Intel XE#771</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/899">Intel XE#899</a>) +3 other tests ( 2 fail )</=
li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#445=
9</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
829/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12829/shard-lnl-6/igt@kms_vrr=
@cmrr@pipe-a-edp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test ( 1 fail, 1 =
pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8284/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12829/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec=
-null-defer-bind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12829/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-nul=
l-defer-bind.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 1 pass, 1 skip )=
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8284 -&gt; IGTPW_12829</li>
</ul>
<p>IGTPW_12829: 12829<br />
  IGT_8284: 8284<br />
  xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7: afc2e1fea0a406eedbaf632=
e96cdb6832a45ebb7</p>

</body>
</html>

--===============7135306931905105230==--
