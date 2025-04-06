Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80F9C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 23:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADCC10E163;
	Sun,  6 Apr 2025 23:11:33 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E2A10E15B;
 Sun,  6 Apr 2025 23:11:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8632379349590061993=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Stress_copy_engines_during?=
 =?utf-8?q?_render_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 23:11:32 -0000
Message-ID: <174398109296.41500.2025273014022623810@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401140510.38142-1-francois.dugast@intel.com>
In-Reply-To: <20250401140510.38142-1-francois.dugast@intel.com>
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

--===============8632379349590061993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Stress copy engines during render (rev6)
URL   : https://patchwork.freedesktop.org/series/145831/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8297_FULL -> XEIGTPW_12898_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12898_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12898_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12898_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          NOTRUN -> ([SKIP][1], [ABORT][2]) ([Intel XE#2763]) +1 other test ( 1 abort, 1 skip )
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * {igt@xe_spin_batch@spin-mem-copy} (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][3] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@xe_spin_batch@spin-mem-copy.html

  
#### Warnings ####

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][4] ([Intel XE#1127]) -> ([ABORT][5], [SKIP][6]) ([Intel XE#1127])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  
New tests
---------

  New tests have been introduced between XEIGT_8297_FULL and XEIGTPW_12898_FULL:

### New IGT tests (5) ###

  * igt@xe_render_copy@render-stress-0-copies:
    - Statuses : 2 pass(s)
    - Exec time: [3.22, 3.23] s

  * igt@xe_render_copy@render-stress-1-copies:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [3.23] s

  * igt@xe_render_copy@render-stress-2-copies:
    - Statuses : 2 pass(s)
    - Exec time: [3.23, 3.24] s

  * igt@xe_render_copy@render-stress-4-copies:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [3.25, 5.16] s

  * igt@xe_spin_batch@spin-mem-copy:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [0.11, 6.02] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12898_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#3157])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#3767]) +15 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#2550] / [Intel XE#3767]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][11], [SKIP][12]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][14] -> ([PASS][15], [SKIP][16]) ([Intel XE#2314] / [Intel XE#2894])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#787]) +148 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][18], [SKIP][19]) ([Intel XE#455] / [Intel XE#787]) +11 other tests ( 2 skip )
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][20], [SKIP][21]) ([Intel XE#2652] / [Intel XE#787]) +3 other tests ( 2 skip )
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][23], [SKIP][24]) ([Intel XE#787]) +39 other tests ( 2 skip )
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][26] -> ([PASS][27], [INCOMPLETE][28]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][31] -> ([PASS][32], [INCOMPLETE][33]) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#4416]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][35], [SKIP][36]) ([Intel XE#373])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#373]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][39] ([Intel XE#4132])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1424])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][41] -> [SKIP][42] ([Intel XE#309]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#309])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [PASS][44] -> ([SKIP][45], [SKIP][46]) ([Intel XE#2291]) +1 other test ( 2 skip )
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][47] -> ([SKIP][48], [PASS][49]) ([Intel XE#2291]) +2 other tests ( 1 pass, 1 skip )
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2-set2:     [PASS][50] -> ([SKIP][51], [PASS][52]) ([Intel XE#309]) +1 other test ( 1 pass, 1 skip )
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][53] -> ([FAIL][54], [FAIL][55]) ([Intel XE#1475])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-lnl:          [PASS][56] -> ([PASS][57], [INCOMPLETE][58]) ([Intel XE#3226]) +1 other test ( 1 incomplete, 1 pass )
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-6/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-7/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-3/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#4302])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#4494])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#3009])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_dp_aux_dev.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [PASS][63] -> ([SKIP][64], [SKIP][65]) ([Intel XE#4354])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-sst.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#4356])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#455]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#4422])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][69] -> ([SKIP][70], [SKIP][71]) ([Intel XE#310])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][72] -> ([SKIP][73], [PASS][74]) ([Intel XE#310]) +2 other tests ( 1 pass, 1 skip )
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([PASS][75], [FAIL][76]) ([Intel XE#3321]) +3 other tests ( 1 fail, 1 pass )
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][77] -> ([FAIL][78], [FAIL][79]) ([Intel XE#301]) +3 other tests ( 2 fail )
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([FAIL][80], [FAIL][81]) ([Intel XE#3321]) +1 other test ( 2 fail )
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-bmg:          [PASS][82] -> ([SKIP][83], [SKIP][84]) ([Intel XE#2316])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-modeset.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#2316]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1421]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg2-set2:     [PASS][88] -> [SKIP][89] ([Intel XE#310]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_flip@2x-plain-flip.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][90] -> ([SKIP][91], [PASS][92]) ([Intel XE#2316]) +9 other tests ( 1 pass, 1 skip )
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][93] -> ([FAIL][94], [PASS][95]) ([Intel XE#886]) +4 other tests ( 1 fail, 1 pass )
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][96] -> [FAIL][97] ([Intel XE#301])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [PASS][98] -> ([PASS][99], [FAIL][100]) ([Intel XE#3321]) +4 other tests ( 1 fail, 1 pass )
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][101] ([Intel XE#301]) +5 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          [PASS][102] -> [FAIL][103] ([Intel XE#3321]) +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][104], [INCOMPLETE][105]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 2 incomplete )
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][106] -> [DMESG-WARN][107] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:
    - shard-bmg:          [PASS][108] -> ([FAIL][109], [PASS][110]) ([Intel XE#2882]) +1 other test ( 1 fail, 1 pass )
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1401]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#651])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#651]) +7 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][115], [SKIP][116]) ([Intel XE#651])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][117] -> ([PASS][118], [SKIP][119]) ([Intel XE#656]) +6 other tests ( 1 pass, 1 skip )
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#656])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][121] -> ([SKIP][122], [SKIP][123]) ([Intel XE#656])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][124] -> [SKIP][125] ([Intel XE#656]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#656]) +6 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#653]) +4 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][128] -> [SKIP][129] ([Intel XE#1503])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][130] -> ([PASS][131], [SKIP][132]) ([Intel XE#1503]) +1 other test ( 1 pass, 1 skip )
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-1/igt@kms_hdr@static-swap.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_hdr@static-swap.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][133] -> [SKIP][134] ([Intel XE#4328])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_joiner@basic-force-big-joiner.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
    - shard-bmg:          [PASS][135] -> ([SKIP][136], [PASS][137]) ([Intel XE#3012])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][138] -> ([SKIP][139], [SKIP][140]) ([Intel XE#4596])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     [PASS][141] -> ([PASS][142], [SKIP][143]) ([Intel XE#4596])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-none.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-none.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b:
    - shard-lnl:          NOTRUN -> ([SKIP][144], [SKIP][145]) ([Intel XE#2763]) +1 other test ( 2 skip )
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#870])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][147] -> ([FAIL][148], [PASS][149]) ([Intel XE#718])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#908])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][151] -> ([SKIP][152], [PASS][153]) ([Intel XE#836])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][154] -> [SKIP][155] ([Intel XE#836])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#2893])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#2893] / [Intel XE#4608])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#4608]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][159], [SKIP][160]) ([Intel XE#1122])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#1406]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@kms_psr@pr-no-drrs.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][163] -> [FAIL][164] ([Intel XE#2883]) +2 other tests fail
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_setmode@basic.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][165] -> [SKIP][166] ([Intel XE#1435])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> [ABORT][167] ([Intel XE#4540])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][168] ([Intel XE#4212])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][169] -> ([FAIL][170], [FAIL][171]) ([Intel XE#771])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#1499])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [PASS][173] -> ([INCOMPLETE][174], [PASS][175]) ([Intel XE#4358]) +1 other test ( 1 incomplete, 1 pass )
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-3/igt@xe_ccs@suspend-resume.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@xe_ccs@suspend-resume.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7/igt@xe_ccs@suspend-resume.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#1123])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#2905]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#2905] / [Intel XE#4259])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-1/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#2905]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_evict@evict-beng-small:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#688])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [PASS][181] -> ([SKIP][182], [SKIP][183]) ([Intel XE#1392])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][184] -> [SKIP][185] ([Intel XE#1392]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#1392]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [PASS][187] -> ([PASS][188], [SKIP][189]) ([Intel XE#1392]) +5 other tests ( 1 pass, 1 skip )
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][190], [SKIP][191]) ([Intel XE#288]) +1 other test ( 2 skip )
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#288]) +5 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#2229])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#378])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][196] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][197], [FAIL][198]) ([Intel XE#1173])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#2284] / [Intel XE#366])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][200] -> [ABORT][201] ([Intel XE#1794])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][202] -> ([PASS][203], [ABORT][204]) ([Intel XE#1794]) +2 other tests ( 1 abort, 1 pass )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#944])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#944])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [PASS][207] -> [DMESG-WARN][208] ([Intel XE#4173]) +7 other tests dmesg-warn
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@xe_wedged@basic-wedged.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-adlp-9/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * {igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries}:
    - shard-lnl:          [ABORT][209] ([Intel XE#4624]) -> ([PASS][210], [PASS][211])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-7/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][212] ([Intel XE#827]) -> ([PASS][213], [PASS][214]) +1 other test ( 2 pass )
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][215] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][217] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][219] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][221] ([Intel XE#2291]) -> ([PASS][222], [PASS][223]) +1 other test ( 2 pass )
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][224] ([Intel XE#2291]) -> [PASS][225] +2 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#309]) -> ([PASS][227], [PASS][228])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#309]) -> [PASS][230] +2 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#455]) -> ([PASS][232], [PASS][233])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][234] ([Intel XE#2316]) -> [PASS][235] +1 other test pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#310]) -> ([PASS][237], [PASS][238])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][239] ([Intel XE#301]) -> [PASS][240] +2 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][241] ([Intel XE#301]) -> ([PASS][242], [PASS][243])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#310]) -> [PASS][245] +4 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [SKIP][246] ([Intel XE#2316]) -> ([PASS][247], [PASS][248])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:
    - shard-bmg:          [FAIL][249] ([Intel XE#2882]) -> ([PASS][250], [PASS][251]) +1 other test ( 2 pass )
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [FAIL][252] ([Intel XE#3098] / [Intel XE#886]) -> ([PASS][253], [PASS][254])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][255] ([Intel XE#886]) -> ([PASS][256], [PASS][257]) +2 other tests ( 2 pass )
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a2:
    - shard-dg2-set2:     [FAIL][258] ([Intel XE#3098]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a2.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2:
    - shard-dg2-set2:     [FAIL][260] ([Intel XE#886]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a2:
    - shard-dg2-set2:     [FAIL][262] -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a2.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1:
    - shard-adlp:         [FAIL][264] -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#656]) -> [PASS][267] +2 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#656]) -> ([PASS][269], [PASS][270])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [INCOMPLETE][271] -> [PASS][272] +1 other test pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-6/igt@kms_plane_cursor@primary.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@kms_plane_cursor@primary.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][273] ([Intel XE#1435]) -> ([PASS][274], [PASS][275])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][276] ([Intel XE#1435]) -> [PASS][277]
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#1392]) -> [PASS][279] +3 other tests pass
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#1392]) -> ([PASS][281], [PASS][282]) +5 other tests ( 2 pass )
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [DMESG-WARN][283] ([Intel XE#4173]) -> [PASS][284] +1 other test pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [FAIL][285] ([Intel XE#4541]) -> ([PASS][286], [PASS][287])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-lnl-4/igt@xe_oa@buffer-size.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-1/igt@xe_oa@buffer-size.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@xe_oa@buffer-size.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][288] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-adlp-4/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][290] ([Intel XE#1794]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][293], [SKIP][294]) ([Intel XE#787]) +1 other test ( 2 skip )
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#787]) -> [SKIP][296] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#787]) -> ([SKIP][298], [SKIP][299]) ([Intel XE#455] / [Intel XE#787]) +3 other tests ( 2 skip )
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][301] ([Intel XE#787]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][302] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> ([PASS][303], [INCOMPLETE][304]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#4418]) -> ([SKIP][306], [SKIP][307]) ([Intel XE#4418] / [Intel XE#4440])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][308] ([Intel XE#2341]) -> [INCOMPLETE][309] ([Intel XE#4132])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][310] ([Intel XE#1178]) -> ([FAIL][311], [SKIP][312]) ([Intel XE#1178] / [Intel XE#2341])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_content_protection@lic-type-0.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-8/igt@kms_content_protection@lic-type-0.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#309]) -> ([SKIP][314], [PASS][315]) ([Intel XE#309]) +1 other test ( 1 pass, 1 skip )
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#455] / [i915#3804]) -> [SKIP][317] ([i915#3804])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][318] ([Intel XE#4354]) -> ([SKIP][319], [PASS][320]) ([Intel XE#4354])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#310]) -> ([SKIP][322], [PASS][323]) ([Intel XE#310]) +2 other tests ( 1 pass, 1 skip )
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][324] ([Intel XE#2316]) -> ([FAIL][325], [FAIL][326]) ([Intel XE#3321])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][327] ([Intel XE#3321]) -> [SKIP][328] ([Intel XE#2316])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][329] ([Intel XE#301]) -> ([PASS][330], [FAIL][331]) ([Intel XE#301])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][332] ([Intel XE#2316]) -> ([SKIP][333], [PASS][334]) ([Intel XE#2316]) +3 other tests ( 1 pass, 1 skip )
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][335] ([Intel XE#2312]) -> ([SKIP][336], [SKIP][337]) ([Intel XE#2311]) +8 other tests ( 2 skip )
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][338] ([Intel XE#2311]) -> ([SKIP][339], [SKIP][340]) ([Intel XE#2311] / [Intel XE#2312]) +24 other tests ( 2 skip )
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#651]) -> [SKIP][342] ([Intel XE#656]) +11 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#656]) -> ([SKIP][344], [SKIP][345]) ([Intel XE#651]) +4 other tests ( 2 skip )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][346] ([Intel XE#2312]) -> ([SKIP][347], [SKIP][348]) ([Intel XE#2311] / [Intel XE#2312]) +2 other tests ( 2 skip )
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#656]) -> ([SKIP][350], [PASS][351]) ([Intel XE#656])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][352] ([Intel XE#4141]) -> ([SKIP][353], [SKIP][354]) ([Intel XE#2312]) +4 other tests ( 2 skip )
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][355] ([Intel XE#2312]) -> [SKIP][356] ([Intel XE#4141]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][357] ([Intel XE#4141]) -> [SKIP][358] ([Intel XE#2312])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][359] ([Intel XE#2312]) -> ([SKIP][360], [SKIP][361]) ([Intel XE#4141]) +4 other tests ( 2 skip )
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][362] ([Intel XE#2312]) -> ([SKIP][363], [SKIP][364]) ([Intel XE#2312] / [Intel XE#4141])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][365] ([Intel XE#4141]) -> ([SKIP][366], [SKIP][367]) ([Intel XE#2312] / [Intel XE#4141]) +6 other tests ( 2 skip )
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#656]) -> [SKIP][369] ([Intel XE#651]) +4 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][370] ([Intel XE#2312]) -> [SKIP][371] ([Intel XE#2311]) +5 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][372] ([Intel XE#2311]) -> ([SKIP][373], [SKIP][374]) ([Intel XE#2312]) +1 other test ( 2 skip )
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][375] ([Intel XE#2311]) -> [SKIP][376] ([Intel XE#2312]) +4 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#656]) -> ([SKIP][378], [SKIP][379]) ([Intel XE#651] / [Intel XE#656])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#651]) -> ([SKIP][381], [SKIP][382]) ([Intel XE#656]) +1 other test ( 2 skip )
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#651]) -> ([SKIP][384], [SKIP][385]) ([Intel XE#651] / [Intel XE#656]) +11 other tests ( 2 skip )
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][386] ([Intel XE#2312]) -> ([SKIP][387], [SKIP][388]) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][389] ([Intel XE#2313]) -> [SKIP][390] ([Intel XE#2312]) +3 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#656]) -> ([SKIP][392], [SKIP][393]) ([Intel XE#653] / [Intel XE#656]) +2 other tests ( 2 skip )
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][394] ([Intel XE#2312]) -> [SKIP][395] ([Intel XE#2313]) +6 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][396] ([Intel XE#2313]) -> ([SKIP][397], [SKIP][398]) ([Intel XE#2312]) +1 other test ( 2 skip )
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][399] ([Intel XE#2313]) -> ([SKIP][400], [SKIP][401]) ([Intel XE#2312] / [Intel XE#2313]) +19 other tests ( 2 skip )
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#653]) -> ([SKIP][403], [SKIP][404]) ([Intel XE#656])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][405] ([Intel XE#2312]) -> ([SKIP][406], [SKIP][407]) ([Intel XE#2313]) +10 other tests ( 2 skip )
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#653]) -> [SKIP][409] ([Intel XE#656]) +7 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#656]) -> [SKIP][411] ([Intel XE#653]) +3 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#656]) -> ([SKIP][413], [SKIP][414]) ([Intel XE#653])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#653]) -> ([SKIP][416], [SKIP][417]) ([Intel XE#653] / [Intel XE#656]) +14 other tests ( 2 skip )
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#455]) -> ([SKIP][419], [PASS][420]) ([Intel XE#455])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][421] ([Intel XE#1503]) -> ([SKIP][422], [PASS][423]) ([Intel XE#1503])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-2/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][424] ([Intel XE#616]) -> ([FAIL][425], [PASS][426]) ([Intel XE#616]) +1 other test ( 1 fail, 1 pass )
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_plane_cursor@viewport.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_plane_cursor@viewport.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][427] ([Intel XE#4596]) -> ([PASS][428], [SKIP][429]) ([Intel XE#4596])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][430] ([Intel XE#4596]) -> ([SKIP][431], [SKIP][432]) ([Intel XE#2493])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#455]) -> ([SKIP][434], [ABORT][435]) ([Intel XE#4540] / [Intel XE#455])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#362]) -> ([FAIL][437], [FAIL][438]) ([Intel XE#1729])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][439] ([Intel XE#2509]) -> ([SKIP][440], [SKIP][441]) ([Intel XE#2426])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [FAIL][442] ([Intel XE#4278]) -> ([PASS][443], [FAIL][444]) ([Intel XE#4278]) +1 other test ( 1 fail, 1 pass )
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1392]) -> ([PASS][446], [SKIP][447]) ([Intel XE#1392])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#1061]) -> ([FAIL][449], [FAIL][450]) ([Intel XE#1173])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/shard-dg2-432/igt@xe_peer2peer@write.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@xe_peer2peer@write.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4259
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4358
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8297 -> IGTPW_12898
  * Linux: xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201 -> xe-2890-2b5616d699e52553398fd5a2736646ad59716bee

  IGTPW_12898: 12898
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9180336b156148e201
  xe-2890-2b5616d699e52553398fd5a2736646ad59716bee: 2b5616d699e52553398fd5a2736646ad59716bee

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/index.html

--===============8632379349590061993==
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
<tr><td><b>Series:</b></td><td>Stress copy engines during render (rev6)</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/145831/">https://patchwork.freedesktop.org/series/145831/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12898/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12898/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8297_FULL -&gt; XEIGTPW_12898_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12898_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12898_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
898_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@kms_plane_scaling@plane-downsca=
le-factor-0-5-with-modifiers.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@kms_plane_scaling@plane-=
downscale-factor-0-5-with-modifiers.html">ABORT</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other=
 test ( 1 abort, 1 skip )</li>
</ul>
</li>
<li>
<p>{igt@xe_spin_batch@spin-mem-copy} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@xe_spin_batch@spin-mem-copy.ht=
ml">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1127">Intel XE#1127</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12898/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-r=
eflect-x-180.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12898/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflec=
t-x-180.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8297_FULL and XEIGTPW_12898=
_FULL:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.22, 3.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.23, 3.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [3.25, 5.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [0.11, 6.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12898_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-=
a-2-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel X=
E#3767</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12898/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-=
3840x2160p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12898/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-=
3840x2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled=
-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +148 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-t=
iled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_ccs@crc-primary-b=
asic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_ccs@crc-primary-rot=
ation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-bas=
ic-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_ccs@crc-sprite-=
planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +39 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-t=
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
e/IGT_8297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_ccs@random-ccs-data-=
4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#=
3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-b-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel=
 XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-a-dp-4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#311=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212=
">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-with-=
enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_content_protection@atomic-dp=
ms@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4132">Intel XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-move=
ment-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomi=
c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12898/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-ato=
mic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-fli=
pb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12898/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard=
-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12898/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard=
-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-siz=
e.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12898/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-=
size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12898/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-siz=
e.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/309">Intel XE#309</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transiti=
ons.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12898/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tra=
nsitions.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12898/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tran=
sitions.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-6/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1289=
8/shard-lnl-7/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-3/i=
gt@kms_cursor_legacy@forked-bo@all-pipes.html">INCOMPLETE</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>=
) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6b=
pc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_dp=
_aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/=
shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt=
@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_dp_link_training@uhbr-sst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_dsc@dsc-with-bpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@2x-blocking-absolute-wf_vblank-interr=
uptible.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vbla=
nk-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_v=
blank-interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/sh=
ard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms=
_flip@2x-dpms-vs-vblank-race.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests ( 1=
 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbl=
ank@ab-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank=
@ab-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests ( 1 fail, 1 pa=
ss )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12898/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdm=
i-a6-dp4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12898/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi=
-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/301">Intel XE#301</a>) +3 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbl=
ank@ac-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank=
@ac-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bm=
g-4/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_flip@2x-flip-=
vs-modeset.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/s=
hard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-46=
4/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12898/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12898/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2316">Intel XE#2316</a>) +9 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/=
shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@k=
ms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tes=
ts ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/sha=
rd-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
dp2.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12898/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@b-dp2.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12898/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e@b-dp2.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3321">Intel XE#3321</a>) +4 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblan=
k@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898=
/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3=
321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_flip@flip-vs-suspend-inte=
rruptible.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interrupti=
ble.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test ( 2 inc=
omplete )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/s=
hard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE=
#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4173">Intel XE#4173</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1289=
8/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/i=
gt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 o=
ther test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p=
-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs=
-modesetfrombusy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-mode=
setfrombusy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-move.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-cur-indfb-move.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests ( 1 pa=
ss, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2=
p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-draw-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2=
p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-=
bmg-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-1/igt@kms_hdr@static-swap.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@=
kms_hdr@static-swap.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_hdr@static-swap.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_joiner@basic-force-big-joiner.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/s=
hard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328=
</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/sh=
ard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-8/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard=
-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_plane_m=
ultiple@2x-tiling-4.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-none.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/=
shard-dg2-463/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt=
@kms_plane_multiple@2x-tiling-none.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@kms_plane_scaling@plane-downsca=
le-factor-0-5-with-modifiers@pipe-b.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@kms_plane_scaling=
@plane-downscale-factor-0-5-with-modifiers@pipe-b.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpm=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12898/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">I=
ntel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1289=
8/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435=
/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/=
shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12898/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel X=
E#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-8/igt@kms_psr@pr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@k=
ms_setmode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12898/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_setmode@invalid-clone-sing=
le-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">ABORT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_setmode@invalid-clone-sing=
le-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12898/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12898/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/771">Intel XE#771</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-3/igt@xe_ccs@suspend-resume.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/ig=
t@xe_ccs@suspend-resume.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7/igt@xe_ccs@suspend-resume.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4358">Intel XE#4358</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-=
0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-extende=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-1/igt@xe_eudebug@discovery-race-sigint=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4259">Intel XE#4259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@xe_eudebug_online@reset-with-a=
ttention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@xe_evict@evict-beng-small.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
8">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-rebind.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12898/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898=
/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">In=
tel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12898/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-4/igt@xe_exec_basic@multigpu-once-null=
-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@xe_exec_basic@multigpu-once-null-rebind.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12898/shard-dg2-466/igt@xe_exec_basic@multigpu-once-null-rebind.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard=
-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#13=
92</a>) +5 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@xe_exec_fault_mode@invalid-va=
-scratch-nopagefault.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@xe_exec_fault_mode@invalid-va-=
scratch-nopagefault.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@xe_exec_fault_mode@many-execqu=
eues-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_va=
lidate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_module_load@force-load.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@xe_oa@oa-tlb-invalidate.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@xe_peer2peer@write@write-gpua=
-vram01-gpub-system-p2p.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-adlp-9=
/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-3=
/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-2/igt@xe_pm@s4-vm-bind-userpt=
r.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1794">Intel XE#1794</a>) +2 other tests ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-3/igt@xe_query@multigpu-query-topology=
-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@xe_query@multigpu-query-topolo=
gy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-adlp-9/=
igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +7 other test=
s dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4624">Intel XE#4624</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-lnl-7/igt@intel_sysfs_debugfs@xe-debugfs-r=
ead-all-entries.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12898/shard-lnl-8/igt@intel_sysfs_debugfs@xe-debugfs-read-a=
ll-entries.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/82=
7">Intel XE#827</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12898/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12898/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS=
</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_bw@connecte=
d-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1289=
8/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hd=
mi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4522">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-=
rc-ccs@pipe-c-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs=
-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-2/igt@kms_cursor_legacy@=
2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-2/igt@kms_curs=
or_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>) +1 o=
ther test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb=
-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12898/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-to=
ggle.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12898/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html=
">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_cursor_le=
gacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +2 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12898/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-d=
g2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
98/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_f=
lip@2x-flip-vs-dpms.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_flip@2x-flip=
-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> +2 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-v=
blank@ad-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ad-hdmi-a6-dp4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recre=
ate-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">I=
ntel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12898/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/s=
hard-bmg-1/igt@kms_flip@2x-plain-flip-interruptible.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2882">Intel XE#2882</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank=
@a-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12898/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi=
-a3.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">=
Intel XE#3098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/886">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@flip-vs-blocking-wf-=
vblank.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12898/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PA=
SS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
86">Intel XE#886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12898/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-ed=
p1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12898/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">P=
ASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a2.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3098">Intel XE#3098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vbl=
ank@a-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/886">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblan=
k@b-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a2.=
html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12898/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a2.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1.h=
tml">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12898/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a1.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_frontbuffer_tracki=
ng@fbc-2p-primscrn-shrfb-plflip-blt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_frontb=
uffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-6/igt@kms_plane_cursor@primary.html">INCOMPLETE</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-=
lnl-4/igt@kms_plane_cursor@primary.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel=
 XE#1435</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12898/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg=
-3/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">=
Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12898/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@xe_exec_basic@multi=
gpu-many-execqueues-many-vm-null-rebind.html">PASS</a> +3 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mma=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-mmap.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12898/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-b=
asic-defer-mmap.html">PASS</a>) +5 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-=
xe_guc_relay_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-adlp-4/igt@xe_fault_=
injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-lnl-4/igt@xe_oa@buffer-size.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel XE#4541</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shar=
d-lnl-1/igt@xe_oa@buffer-size.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12898/shard-lnl-5/igt@xe_oa@buffer-size.html"=
>PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">I=
ntel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-adlp-4/igt@xe_pm@s2idle-d3hot-basic-exec.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1=
794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2898/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs=
@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_=
ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-=
463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/787">Intel XE#787</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-c=
c@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_ccs@crc-prim=
ary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/sh=
ard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pi=
pe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-cc=
s-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt=
@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"=
>Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418=
">Intel XE#4418</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12898/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2898/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Int=
el XE#4418</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Int=
el XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12898/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
32">Intel XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12898/shard-bmg-8/igt@kms_content_protection@lic-type-0.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-b=
mg-4/igt@kms_content_protection@lic-type-0.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel X=
E#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12898/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-at=
omic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12898/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a=
-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_dither@fb-8bp=
c-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Inte=
l XE#4354</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12898/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-b=
mg-1/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12898/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12898/shard-dg2-463/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">=
Intel XE#310</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12898/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard=
-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-v=
blank@bc-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vb=
lank@bc-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12898/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard=
-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)=
 +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-8/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Int=
el XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312">Intel XE#2312</a>) +24 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer=
_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_frontbuffer=
_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@km=
s_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7/igt@kms_frontbuffer_tracking=
@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_trac=
king@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_=
frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel =
XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_frontbuffer_tracki=
ng@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontb=
uffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141=
">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr=
-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@k=
ms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"=
>Intel XE#2312</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-ind=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
hrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
6">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">=
Intel XE#656</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
3">Intel XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/656">Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-1/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +19 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-3/igt@kms_frontbuffer_trackin=
g@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@kms_frontbuffer_=
tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_frontbuffer_tracki=
ng@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@kms_frontbuffer_=
tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@kms_frontbuffer_=
tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_=
frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/sh=
ard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_hdr@invalid=
-hdr.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/=
shard-bmg-4/igt@kms_hdr@static-toggle.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-2/igt@kms_hdr@static-=
toggle.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#61=
6</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
898/shard-dg2-435/igt@kms_plane_cursor@viewport.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-433/igt@kms=
_plane_cursor@viewport.html">PASS</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test ( 1 fail, =
1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12898/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-b=
mg-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel =
XE#4596</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12898/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-bmg-7=
/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12898/shard-dg2-464/igt@kms_setmode@invalid-clone-single=
-crtc-stealing.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12898/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crt=
c-stealing.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4540">Intel XE#4540</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12898/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898=
/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE=
#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12898/shard-bmg-8/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12898/shard-bmg-4/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278=
">Intel XE#4278</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12898/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2898/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278">Int=
el XE#4278</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-435/igt@xe_exec_basic@multigpu=
-many-execqueues-many-vm-userptr.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-432/igt@xe_exec_basic@mult=
igpu-many-execqueues-many-vm-userptr.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8297/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/s=
hard-dg2-435/igt@xe_peer2peer@write.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12898/shard-dg2-466/igt@xe_peer2peer@wr=
ite.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8297 -&gt; IGTPW_12898</li>
<li>Linux: xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201 -&gt; xe-2890-2=
b5616d699e52553398fd5a2736646ad59716bee</li>
</ul>
<p>IGTPW_12898: 12898<br />
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9=
180336b156148e201<br />
  xe-2890-2b5616d699e52553398fd5a2736646ad59716bee: 2b5616d699e52553398fd5a=
2736646ad59716bee</p>

</body>
</html>

--===============8632379349590061993==--
