Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92C4E77188
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 00:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862C510E48E;
	Wed, 15 Jan 2025 00:01:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFC210E3B1;
 Wed, 15 Jan 2025 00:01:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7654149362702725861=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel-ci=3A_Fix_a_sy?=
 =?utf-8?q?ntax_err_in_xe=2Eblocklist=2Etxt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jan 2025 00:01:11 -0000
Message-ID: <173689927142.3758484.13032617055866397864@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250114173523.3267049-1-oak.zeng@intel.com>
In-Reply-To: <20250114173523.3267049-1-oak.zeng@intel.com>
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

--===============7654149362702725861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Fix a syntax err in xe.blocklist.txt
URL   : https://patchwork.freedesktop.org/series/143518/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8190_full -> XEIGTPW_12437_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12437_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12437_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12437_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] +23 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  
New tests
---------

  New tests have been introduced between XEIGT_8190_full and XEIGTPW_12437_full:

### New IGT tests (1) ###

  * igt@xe_copy_basic:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12437_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-lnl:          NOTRUN -> [ABORT][9] ([Intel XE#3914])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1466])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#873])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#316]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2136] / [Intel XE#2231]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1467])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124]) +11 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1477])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2191]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#367]) +11 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2191]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +195 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +41 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#3432]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#3442])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#2907])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2669]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1727] / [Intel XE#3124])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][35] ([Intel XE#1727] / [Intel XE#3113])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#3124])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#306])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#306]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373]) +14 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#373]) +5 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#3278]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2341])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#1178])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1424]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#308]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2321]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#3007]) +10 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [PASS][51] -> [INCOMPLETE][52] ([Intel XE#3226])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([i915#2575]) +11 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][55] -> [DMESG-WARN][56] ([Intel XE#877])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#2291]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#309])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2244])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#701])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1135])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1421]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#2316]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][66] -> [INCOMPLETE][67] ([Intel XE#2635]) +1 other test incomplete
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#886]) +10 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][70] ([Intel XE#301]) +3 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][71] -> [INCOMPLETE][72] ([Intel XE#2597])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][73] -> [INCOMPLETE][74] ([Intel XE#2049] / [Intel XE#2597])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][75] -> [INCOMPLETE][76] ([Intel XE#2049])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2293])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1401]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([i915#5274])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2311])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#651]) +45 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#2136] / [Intel XE#2231]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [FAIL][85] ([Intel XE#2333]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#651]) +8 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2136] / [Intel XE#2231])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2313]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#656]) +20 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1158])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#653]) +39 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     NOTRUN -> [ABORT][92] ([Intel XE#2625])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][93] ([Intel XE#4048])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1503])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     NOTRUN -> [FAIL][95] ([Intel XE#616]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][96] ([Intel XE#361])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2763]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2763]) +8 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#2763]) +11 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#870])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          NOTRUN -> [FAIL][102] ([Intel XE#718])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#908]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#2446])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [PASS][106] -> [SKIP][107] ([Intel XE#2446]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2446])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1489]) +16 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2893]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1122])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2850] / [Intel XE#929]) +18 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2234] / [Intel XE#2850])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1406]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#3414]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#3414] / [Intel XE#3904])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([i915#2575]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#2883]) +2 other tests fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1500])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#2168])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#2159]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#455]) +26 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1499])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#756]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#756])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1091] / [Intel XE#2849])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1447])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic (NEW):
    - shard-bmg:          NOTRUN -> [INCOMPLETE][131] ([Intel XE#2594])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-5/igt@xe_copy_basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1123])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1126])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#2905]) +11 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@xe_eudebug@basic-close.html
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#2905]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#3889]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#3889])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#688]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [PASS][139] -> [SKIP][140] ([Intel XE#1392]) +4 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1392]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#288]) +31 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#2360])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#584])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_intel_bb@intel-bb-blit-x:
    - shard-bmg:          [PASS][145] -> [SKIP][146] ([Intel XE#1130]) +35 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-3/igt@xe_intel_bb@intel-bb-blit-x.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@xe_intel_bb@intel-bb-blit-x.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2229])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#4045])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_module_load@force-load:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#378])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][150] -> [FAIL][151] ([Intel XE#3546])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-2/igt@xe_module_load@many-reload.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@xe_module_load@many-reload.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][152] ([Intel XE#3546])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_module_load@many-reload.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#2541] / [Intel XE#3573]) +10 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#1420] / [Intel XE#2838])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#979])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1061])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_peer2peer@write.html
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1061])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-7/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#2284] / [Intel XE#366])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#2284])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][160] -> [ABORT][161] ([Intel XE#1358] / [Intel XE#1607])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#579])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#579])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-dg2-set2:     [PASS][164] -> [ABORT][165] ([Intel XE#4046])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@xe_pm_residency@cpg-basic.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - shard-dg2-set2:     [PASS][166] -> [SKIP][167] ([Intel XE#1130]) +16 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@xe_prime_self_import@basic-with_fd_dup.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_prime_self_import@basic-with_fd_dup.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#944]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#944]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#3342])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@large-misaligned-binds-536870912:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#1130]) +10 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_vm@large-misaligned-binds-536870912.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition:
    - shard-bmg:          [INCOMPLETE][172] ([Intel XE#2613]) -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-1/igt@kms_atomic_transition@modeset-transition.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-4/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][174] ([Intel XE#2136] / [Intel XE#2231]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][176] ([Intel XE#3862]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [INCOMPLETE][178] ([Intel XE#3226]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][180] ([Intel XE#2291]) -> [PASS][181] +2 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][182] ([Intel XE#877]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][184] ([Intel XE#3070]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][187] +2 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@kms_fbcon_fbt@fbc.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [ABORT][188] -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@kms_fbcon_fbt@fbc-suspend.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#2423] / [i915#2575]) -> [PASS][191] +5 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@kms_feature_discovery@display.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_feature_discovery@display.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][192] ([Intel XE#2882]) -> [PASS][193] +3 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][194] ([Intel XE#2316]) -> [PASS][195] +2 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [FAIL][196] -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-lnl:          [FAIL][198] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:
    - shard-lnl:          [FAIL][200] ([Intel XE#886]) -> [PASS][201] +2 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#2136]) -> [PASS][203] +2 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][204] ([Intel XE#718]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_sequence@get-busy:
    - shard-bmg:          [SKIP][206] ([Intel XE#3007]) -> [PASS][207] +7 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_sequence@get-busy.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_sequence@get-busy.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][208] ([Intel XE#899]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [ABORT][210] ([Intel XE#2625] / [Intel XE#4057]) -> [PASS][211] +1 other test pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1392]) -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_sip@invalidinstr-disabled:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1130]) -> [PASS][215] +10 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@xe_exec_sip@invalidinstr-disabled.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_exec_sip@invalidinstr-disabled.html

  * igt@xe_exec_threads@threads-bal-shared-vm-rebind:
    - shard-bmg:          [SKIP][216] ([Intel XE#1130]) -> [PASS][217] +12 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-8/igt@xe_exec_threads@threads-bal-shared-vm-rebind.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [SKIP][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243]) ([Intel XE#378]) -> ([PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-435/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-435/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-434/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-434/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-434/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-434/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-435/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-435/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [ABORT][266] ([Intel XE#1358]) -> [PASS][267]
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][268] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][269]
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_pm@s4-vm-bind-prefetch.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][270] ([Intel XE#2327]) -> [SKIP][271] ([Intel XE#2136] / [Intel XE#2231])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#316]) -> [SKIP][273] ([Intel XE#2136] / [Intel XE#2231])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][274] ([Intel XE#1124]) -> [SKIP][275] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#1124]) -> [SKIP][277] ([Intel XE#2136] / [Intel XE#2231])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][278] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][279] ([Intel XE#1124]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][281] ([Intel XE#1124]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][282] ([Intel XE#2887]) -> [SKIP][283] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][284] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][285] ([Intel XE#3432])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2136]) -> [SKIP][287] ([Intel XE#455] / [Intel XE#787])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [FAIL][288] -> [SKIP][289] ([Intel XE#2136] / [Intel XE#2231])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#2907]) -> [SKIP][291] ([Intel XE#2136] / [Intel XE#2231])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][293] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][294] ([Intel XE#2724]) -> [SKIP][295] ([Intel XE#2136] / [Intel XE#2231])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#314]) -> [SKIP][297] ([Intel XE#2136] / [Intel XE#2231])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          [SKIP][298] ([Intel XE#2252]) -> [SKIP][299] ([Intel XE#3007]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-1/igt@kms_chamelium_frames@dp-crc-single.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-single.html
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#373]) -> [SKIP][301] ([i915#2575]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-single.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][302] ([Intel XE#3007]) -> [SKIP][303] ([Intel XE#2252])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [FAIL][304] ([Intel XE#1178]) -> [INCOMPLETE][305] ([Intel XE#2715]) +1 other test incomplete
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#307]) -> [SKIP][307] ([i915#2575]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-bmg:          [SKIP][308] ([Intel XE#2390]) -> [SKIP][309] ([Intel XE#3007])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][310] ([Intel XE#2341]) -> [FAIL][311] ([Intel XE#1178])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-6/igt@kms_content_protection@srm.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          [SKIP][312] ([Intel XE#2320]) -> [SKIP][313] ([Intel XE#3007])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][314] ([Intel XE#2323]) -> [SKIP][315] ([Intel XE#3007])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][316] ([Intel XE#2136] / [Intel XE#2231]) -> [FAIL][317] ([Intel XE#1695])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][318] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][319] ([Intel XE#2293] / [Intel XE#2380])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][320] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][321] ([Intel XE#2136] / [Intel XE#2231])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][322] ([Intel XE#2311]) -> [SKIP][323] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][324] ([Intel XE#2312]) -> [SKIP][325] ([Intel XE#2311]) +7 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-bmg:          [SKIP][326] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][327] ([Intel XE#2311]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][328] ([Intel XE#2312]) -> [FAIL][329] ([Intel XE#2333]) +2 other tests fail
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][330] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][331] ([Intel XE#2312]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [FAIL][332] ([Intel XE#2333]) -> [SKIP][333] ([Intel XE#2312]) +6 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][334] ([Intel XE#2136] / [Intel XE#2231]) -> [FAIL][335] ([Intel XE#2333])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-bmg:          [FAIL][336] ([Intel XE#2333]) -> [SKIP][337] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][338] ([Intel XE#2311]) -> [SKIP][339] ([Intel XE#2312]) +10 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#2136]) -> [SKIP][341] ([Intel XE#651])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#651]) -> [SKIP][343] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][344] ([Intel XE#2313]) -> [SKIP][345] ([Intel XE#2312]) +9 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#653]) -> [SKIP][347] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][348] ([Intel XE#2313]) -> [SKIP][349] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][350] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][351] ([Intel XE#2313]) +2 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2136]) -> [SKIP][353] ([Intel XE#653]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][354] ([Intel XE#2312]) -> [SKIP][355] ([Intel XE#2313]) +7 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [DMESG-WARN][356] ([Intel XE#877]) -> [SKIP][357] ([Intel XE#3007])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][358] ([Intel XE#3007]) -> [SKIP][359] ([Intel XE#2763])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][360] ([Intel XE#2938]) -> [SKIP][361] ([Intel XE#2136] / [Intel XE#2231])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#2938]) -> [SKIP][363] ([Intel XE#2136] / [Intel XE#2231])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#2136]) -> [SKIP][365] ([Intel XE#3309])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          [SKIP][366] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][367] ([Intel XE#3309])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][368] ([Intel XE#1489]) -> [SKIP][369] ([Intel XE#2136] / [Intel XE#2231])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#1489]) -> [SKIP][371] ([Intel XE#2136] / [Intel XE#2231])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-bmg:          [SKIP][372] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][373] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_psr@fbc-pr-primary-render.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_psr@fbc-pr-primary-render.html
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][375] ([Intel XE#2850] / [Intel XE#929])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@kms_psr@fbc-pr-primary-render.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][376] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][377] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][379] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][380] ([Intel XE#3007]) -> [SKIP][381] ([Intel XE#3414] / [Intel XE#3904])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#2423] / [i915#2575]) -> [SKIP][383] ([Intel XE#3414])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-270.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][384] ([Intel XE#2413]) -> [SKIP][385] ([Intel XE#3007])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          [SKIP][386] ([Intel XE#756]) -> [SKIP][387] ([Intel XE#3007])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#756]) -> [SKIP][389] ([i915#2575])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-bmg:          [SKIP][390] ([Intel XE#1130]) -> [SKIP][391] ([Intel XE#2905]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@xe_eudebug@basic-vm-access.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-5/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#2905]) -> [SKIP][393] ([Intel XE#1130])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_eudebug_online@resume-dss.html
    - shard-bmg:          [SKIP][394] ([Intel XE#2905]) -> [SKIP][395] ([Intel XE#1130])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@xe_eudebug_online@resume-dss.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#1130]) -> [SKIP][397] ([Intel XE#2905]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#1392]) -> [SKIP][399] ([Intel XE#1130])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-bmg:          [SKIP][400] ([Intel XE#2322]) -> [SKIP][401] ([Intel XE#1130]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-bmg:          [SKIP][402] ([Intel XE#1130]) -> [SKIP][403] ([Intel XE#2322])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#288]) -> [SKIP][405] ([Intel XE#1130]) +4 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#1130]) -> [SKIP][407] ([Intel XE#288]) +2 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2360]) -> [SKIP][409] ([Intel XE#1130])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][411] ([Intel XE#1130]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][412] ([Intel XE#1358] / [Intel XE#1794]) -> [SKIP][413] ([Intel XE#1130])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4046
  [Intel XE#4048]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4048
  [Intel XE#4057]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8190 -> IGTPW_12437
  * Linux: xe-2483-1c464719f6d86a08c91e6ed5d64db83b166788db -> xe-2485-30226b91b1754fdae425af3397c1e3dcba8264b0

  IGTPW_12437: 0f59ba31e7b6259cc30403659f79160c707f737d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8190: db6e252e00bc44f90b678d547e93b3f02c02c6de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2483-1c464719f6d86a08c91e6ed5d64db83b166788db: 1c464719f6d86a08c91e6ed5d64db83b166788db
  xe-2485-30226b91b1754fdae425af3397c1e3dcba8264b0: 30226b91b1754fdae425af3397c1e3dcba8264b0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/index.html

--===============7654149362702725861==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Fix a syntax err in xe.block=
list.txt</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143518/">https://patchwork.freedesktop.org/series/143518/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12437/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12437/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8190_full -&gt; XEIGTPW_12437_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12437_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12437_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
437_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-=
a-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> +23 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12437/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi=
-a3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-=
dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-inter=
ruptible@ac-dp2-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-e=
dp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12437/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pip=
e-c-edp-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-=
parallel-nofree-samefd.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8190_full and XEIGTPW_12437=
_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_copy_basic:<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12437_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@core_hotunplug@hotreplug-lateclo=
se.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_async_flips@invalid-async-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-18=
0-hflip-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/146=
7">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@kms_bw@connected-linear-tiling=
-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_bw@connected-linear-tiling=
-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-ti=
led-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +195 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-ti=
led-gen12-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-=
tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_chamelium_color@ctm-0-25.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@kms_chamelium_color@ctm-limited-=
range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
373">Intel XE#373</a>) +14 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
3">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-1/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_content_protection@srm@pipe-=
a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_content_protection@srm@pip=
e-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12437/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3007">Intel XE#3007</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2437/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/32=
26">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tran=
sitions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12437/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-ato=
mic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12437/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other=
 tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_feature_discovery@chameliu=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_feature_discovery@psr2.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-3/igt@kms_flip@2x-blocking-absolute-wf=
_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12437/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12437/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2635">Intel XE#2635</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/s=
hard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</=
a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblan=
k@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-7/=
igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
437/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049=
">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12437/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel X=
E#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_force_connector_basic@prun=
e-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +20 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_frontbuffer_tracking@plane=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +39 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend@pip=
e-a-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4048">Intel XE#4048</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_plane_cursor@overlay.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
16">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_pm_backlight@fade-with-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel=
 XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">In=
tel XE#908</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-d=
g2-432/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shar=
d-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +=
1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_pm_rpm@universal-planes-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-pl=
ane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +16 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_psr@pr-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel=
 XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@kms_psr@pr-sprite-plane-move.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_scaling_modes@scaling-mode=
-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-=
lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel X=
E#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-8=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_vrr@flipline.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_writeback@writeback-fb-id.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/756">Intel XE#756</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-un=
bind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@xe_compute@ccs-mode-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
47">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_compute_preempt@compute-thr=
eadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-5/igt@xe_copy_basic.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">In=
tel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-=
0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0=
xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@xe_eudebug@basic-close.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +11 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@xe_eudebug@basic-close.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"=
>Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufenc=
e-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-ufence-=
reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-pa=
rallel-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-rebind.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12437/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_exec_fault_mode@twice-userp=
tr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/288">Intel XE#288</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-=
batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@xe_gt_freq@freq_suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584"=
>Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-3/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg=
-2/igt@xe_intel_bb@intel-bb-blit-x.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +35 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_va=
lidate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_mmap@pci-membarrier-bad-obj=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@xe_module_load@force-load.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
8">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-2/igt@xe_module_load@many-reload.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-=
3/igt@xe_module_load@many-reload.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_module_load@many-reload.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_oa@whitelisted-registers-us=
erspace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +10 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-8/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979=
">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">I=
ntel XE#1061</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-7/igt@xe_peer2peer@write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Int=
el XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/228=
4">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-4/igt@xe_pm@d3cold-mocs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Inte=
l XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-lnl-2=
/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/579">Intel XE#579</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-1/igt@xe_pm@vram-d3cold-threshold.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-436/igt@xe_pm_residency@cpg-basic.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2=
-432/igt@xe_pm_residency@cpg-basic.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4046">Intel XE#4046</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-433/igt@xe_prime_self_import@basic-with_fd_dup.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
437/shard-dg2-432/igt@xe_prime_self_import@basic-with_fd_dup.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_query@multigpu-query-oa-uni=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@xe_query@multigpu-query-topology=
-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-lnl-5/igt@xe_sriov_flr@flr-vf1-clear.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_vm@large-misaligned-binds-5=
36870912.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-1/igt@kms_atomic_transition@modeset-transition.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2613">Intel XE#2613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12437/shard-bmg-4/igt@kms_atomic_transition@modeset-trans=
ition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs=
@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_ccs@crc-p=
rimary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3226">Intel XE#3226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12437/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-leg=
acy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_cursor_=
legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">=
Intel XE#3070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12437/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Inte=
l XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12437/shard-dg2-434/igt@kms_fbcon_fbt@fbc.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-432/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg=
2-436/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@kms_feature_discovery@display.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel =
XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_feature_discovery@display.html=
">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ab-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12437/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">=
FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2437/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
49">Intel XE#3149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-=
interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-interru=
ptible@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-=
4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">PAS=
S</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-=
lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_sequence@get-busy.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/s=
hard-bmg-6/igt@kms_sequence@get-busy.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12437/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@p=
ipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">=
Intel XE#2625</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4057">Intel XE#4057</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_vblank@ts-continuation-s=
uspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_exec_basic@multigpu-no=
-exec-bindexecqueue-userptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-disabled:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@xe_exec_sip@invalidinstr-disabled.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">In=
tel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12437/shard-dg2-433/igt@xe_exec_sip@invalidinstr-disabled.html">PASS=
</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@xe_exec_threads@threads-bal-shared-vm-rebind.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12437/shard-bmg-8/igt@xe_exec_threads@threads-bal-shared-vm=
-rebind.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8190/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-435/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8190/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-=
dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-434/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8190/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8190/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-46=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8190/shard-dg2-436/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@xe_module_load@load.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_819=
0/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8190/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8190/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-464/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8190/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8190/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-=
435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_124=
37/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12437/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/sh=
ard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12437/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-d=
g2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12437/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12437/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-43=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1243=
7/shard-dg2-436/igt@xe_pm@s3-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-432/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#=
1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12437/shard-dg2-435/igt@xe_pm@s4-vm-bind-prefetch.html">PASS<=
/a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12437/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">In=
tel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12437/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-=
async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_big_fb@y-tiled-max-=
hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-=
0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_big_fb@y-tiled-=
max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#22=
31</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-4/igt@kms_big_fb@y=
-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1=
 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-464/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
87">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12437/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2231">Intel XE#2231</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/213=
6">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_ccs@crc-primary-suspend=
-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12437/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-yf-tiled-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.=
html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12437/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2907">Intel XE#2907</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_ccs@random-ccs-dat=
a-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">=
Intel XE#2724</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12437/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/314"=
>Intel XE#314</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12437/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-1/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Int=
el XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12437/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">In=
tel XE#3007</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-single.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">In=
tel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12437/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-single.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/25=
75">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel X=
E#3007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12437/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2=
252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_content_protection@atomic-dpms@=
pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
07">Intel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12437/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/239=
0">Intel XE#2390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12437/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#23=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
437/shard-bmg-2/igt@kms_content_protection@srm.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">I=
ntel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12437/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007=
">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2323">Intel XE#2323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_display_modes@mst-extended-mode-n=
egative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel =
XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12437/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4t=
iledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/=
igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yt=
ileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@k=
ms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">I=
ntel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_frontbuffer_trackin=
g@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-1/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mma=
p-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-4/igt@kms_frontbuffer=
_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multid=
raw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2=
p-pri-indfb-multidraw.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_frontb=
uffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-m=
sflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_frontb=
uffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb565-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_frontbuffe=
r_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-436/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-dra=
w-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_frontbuffer_tracking@=
fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
53">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12437/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdra=
w.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2231">Intel XE#2231</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_frontbuffer_tracki=
ng@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-435/igt@kms_frontbuffer_=
tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) =
+7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
7">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12437/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
07">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale=
-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_plane_scaling@pla=
nes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">=
Intel XE#2938</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12437/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938=
">Intel XE#2938</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12437/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12437/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE=
#3309</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309=
">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-ex=
ceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_psr2_sf@psr2-cur=
sor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#=
2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-=
exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_psr2_sf@psr2=
-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel=
 XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12437/shard-bmg-7/igt@kms_psr@fbc-pr-primary-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234=
">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel =
XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12437/shard-dg2-433/igt@kms_psr@fbc-pr-primary-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE=
#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12437/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel=
 XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12437/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">=
Intel XE#3007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12437/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
14">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3904">Intel XE#3904</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423=
">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@kms_rotation_crc@primary-r=
otation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
413">Intel XE#2413</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12437/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-asp=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/75=
6">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12437/shard-bmg-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@kms_writeback@writeback-fb-id-xrgb2101010.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
756">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12437/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101=
010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#11=
30</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
437/shard-bmg-5/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel X=
E#2905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12437/shard-dg2-432/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#=
2905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12437/shard-bmg-2/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@xe_eudebug_online@writes-caching-vram-bb-sram-=
target-sram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-434/igt@xe_eudebug_online@wr=
ites-caching-vram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe=
_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2322">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12437/shard-bmg-2/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12437/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-defer=
-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-inv=
alidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_exec_faul=
t_mode@many-execqueues-userptr-invalidate-race-prefetch.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#=
1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-reb=
ind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12437/shard-dg2-433/igt@xe_exec_fault_mode@=
many-execqueues-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-=
fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2360">Intel XE#2360</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_exec_mix_modes@exec-sim=
ple-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">=
Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped=
-access.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8190/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Int=
el XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12437/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8190 -&gt; IGTPW_12437</li>
<li>Linux: xe-2483-1c464719f6d86a08c91e6ed5d64db83b166788db -&gt; xe-2485-3=
0226b91b1754fdae425af3397c1e3dcba8264b0</li>
</ul>
<p>IGTPW_12437: 0f59ba31e7b6259cc30403659f79160c707f737d @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8190: db6e252e00bc44f90b678d547e93b3f02c02c6de @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2483-1c464719f6d86a08c91e6ed5d64db83b166788db: 1c464719f6d86a08c91e6ed=
5d64db83b166788db<br />
  xe-2485-30226b91b1754fdae425af3397c1e3dcba8264b0: 30226b91b1754fdae425af3=
397c1e3dcba8264b0</p>

</body>
</html>

--===============7654149362702725861==--
