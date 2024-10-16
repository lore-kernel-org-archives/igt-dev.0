Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29926D20698
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 04:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79C010E2CC;
	Wed, 16 Oct 2024 04:14:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBF310E0A2;
 Wed, 16 Oct 2024 04:14:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8959394572298980128=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_xe=5Ffind=5Fengine=5Fby=5Fcla?=
 =?utf-8?q?ss_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Oct 2024 04:14:16 -0000
Message-ID: <172905205642.1271782.6683151006831150354@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241015141826.4186247-1-pravalika.gurram@intel.com>
In-Reply-To: <20241015141826.4186247-1-pravalika.gurram@intel.com>
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

--===============8959394572298980128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_find_engine_by_class helper
URL   : https://patchwork.freedesktop.org/series/140001/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8074_full -> XEIGTPW_11911_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11911_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11911_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11911_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +4 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] +4 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_setmaster@master-drop-set-root:
    - {shard-bmg}:        [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - {shard-bmg}:        [PASS][9] -> [SKIP][10] +11 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - {shard-bmg}:        [SKIP][11] ([Intel XE#2370]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - {shard-bmg}:        [SKIP][13] ([Intel XE#2252]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - {shard-bmg}:        [SKIP][15] ([Intel XE#2320]) -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - {shard-bmg}:        [SKIP][17] ([Intel XE#2413]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vrr@lobf:
    - {shard-bmg}:        [SKIP][19] ([Intel XE#2168]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@kms_vrr@lobf.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_vrr@lobf.html

  
New tests
---------

  New tests have been introduced between XEIGT_8074_full and XEIGTPW_11911_full:

### New IGT tests (6) ###

  * igt@kms_invalid_mode@zero-clock@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_invalid_mode@zero-clock@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11911_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          NOTRUN -> [FAIL][22] ([Intel XE#911]) +3 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1407])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][24] -> [DMESG-WARN][25] ([Intel XE#877])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#316]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#610])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1124]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1124]) +11 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#367]) +6 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2191])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1512])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#787]) +118 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#2907]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +32 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#1195]) +2 other tests incomplete
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#314]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#306])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#306])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#373]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#373]) +12 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#1178] / [Intel XE#1204])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][47] ([Intel XE#1188]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2321])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-dg2-set2:     [PASS][49] -> [SKIP][50] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#308])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1424])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_edge_walk@128x128-left-edge:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#2577]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-left-edge.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@kms_cursor_edge_walk@128x128-left-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#309])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#323]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#599]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1135])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][59] ([Intel XE#301]) +4 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][60] ([Intel XE#1204]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1421]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#2957])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][64] -> [FAIL][65] ([Intel XE#301]) +7 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1401] / [Intel XE#1745])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1401])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#651]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2351] / [Intel XE#2890])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#651]) +27 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][71] -> [SKIP][72] ([Intel XE#2890]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2890]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#653]) +35 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1158])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#656]) +16 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#605])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][78] -> [DMESG-FAIL][79] ([Intel XE#324]) +4 other tests dmesg-fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-1/igt@kms_plane@plane-position-covered.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          [PASS][80] -> [DMESG-WARN][81] ([Intel XE#324]) +4 other tests dmesg-warn
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][82] ([Intel XE#616]) +3 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][83] -> [FAIL][84] ([Intel XE#361])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#2763]) +7 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2763]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-dg2-set2:     [PASS][88] -> [INCOMPLETE][89] ([Intel XE#1195] / [Intel XE#2566]) +1 other test incomplete
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#870])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-lnl:          [PASS][91] -> [DMESG-FAIL][92] ([Intel XE#1620]) +1 other test dmesg-fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-5/igt@kms_pm_rpm@cursor-dpms.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-2/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [PASS][93] -> [SKIP][94] ([Intel XE#2446])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][95] -> [INCOMPLETE][96] ([Intel XE#1620] / [Intel XE#2864])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1489]) +8 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1122])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2850] / [Intel XE#929]) +16 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@pr-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1406])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@kms_psr@pr-primary-render.html

  * igt@kms_psr@psr2-cursor-plane-move@edp-1:
    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#2948]) +3 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-move@edp-1.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [FAIL][103] ([Intel XE#2948]) +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#327]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1437]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1435])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#330])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][108] -> [FAIL][109] ([Intel XE#899]) +3 other tests fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#455]) +19 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][111] -> [FAIL][112] ([Intel XE#2443]) +1 other test fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-7/igt@kms_vrr@flipline.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#756]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1091] / [Intel XE#2849])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1123])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1126]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2905]) +11 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@xe_eudebug@basic-close.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#688]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#1130]) +20 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1392]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#2754])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#288]) +26 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1130]) +9 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#2905]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-8/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#584])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][128] ([Intel XE#2961]) +1 other test timeout
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@xe_live_ktest@xe_bo.html
    - shard-lnl:          [PASS][129] -> [SKIP][130] ([Intel XE#1192])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-3/igt@xe_live_ktest@xe_bo.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#379])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2541]) +5 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2838] / [Intel XE#979])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][134] ([Intel XE#1173]) +1 other test fail
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2284] / [Intel XE#366])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#2284] / [Intel XE#366])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-6/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1948])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [PASS][138] -> [ABORT][139] ([Intel XE#1358])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-466/igt@xe_pm@s2idle-multiple-execs.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [ABORT][140] ([Intel XE#1694])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][141] -> [ABORT][142] ([Intel XE#1794])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-config:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#944])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#944]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [INCOMPLETE][145] ([Intel XE#1195]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_3d:
    - {shard-bmg}:        [SKIP][147] ([Intel XE#540]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@kms_3d.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_3d.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - {shard-bmg}:        [SKIP][149] ([Intel XE#2461]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-1/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][151] ([Intel XE#1426]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - {shard-bmg}:        [INCOMPLETE][153] -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [ABORT][155] ([Intel XE#2388]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-lnl:          [FAIL][157] ([Intel XE#2577]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-lnl:          [TIMEOUT][159] -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [FAIL][161] ([Intel XE#1475]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-dg2-set2:     [DMESG-WARN][163] ([Intel XE#1620]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_cursor_legacy@torture-bo.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_cursor_legacy@torture-move@pipe-d:
    - shard-dg2-set2:     [DMESG-WARN][165] -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-d.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-d.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][167] ([Intel XE#301]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [ABORT][169] ([Intel XE#2625]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [ABORT][171] -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][173] ([Intel XE#886]) -> [PASS][174] +6 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - {shard-bmg}:        [FAIL][175] -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][177] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][179] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip@nonexisting-fb-interruptible:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#2423] / [i915#2575]) -> [PASS][182] +8 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_flip@nonexisting-fb-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_flip@nonexisting-fb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - {shard-bmg}:        [SKIP][183] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2890]) -> [PASS][186] +2 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - {shard-bmg}:        [SKIP][187] ([Intel XE#2231]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][189] ([Intel XE#324]) -> [PASS][190] +5 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][191] ([Intel XE#324]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_alpha_blend@coverage-7efc:
    - {shard-bmg}:        [SKIP][193] ([Intel XE#829]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@kms_plane_alpha_blend@coverage-7efc.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-2/igt@kms_plane_alpha_blend@coverage-7efc.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][195] ([Intel XE#616]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_plane_cursor@viewport.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][197] ([Intel XE#361]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - {shard-bmg}:        [SKIP][199] ([Intel XE#2446]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2446]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_pm_rpm@universal-planes-dpms.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_properties@connector-properties-legacy:
    - {shard-bmg}:        [SKIP][203] -> [PASS][204] +17 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-1/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          [FAIL][205] ([Intel XE#1649]) -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_psr@fbc-psr2-basic@edp-1.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][207] ([Intel XE#2948]) -> [PASS][208] +5 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@xe_dma_buf_sync@export-dma-buf-many-write-sync:
    - shard-lnl:          [DMESG-WARN][209] -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-6/igt@xe_dma_buf_sync@export-dma-buf-many-write-sync.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@xe_dma_buf_sync@export-dma-buf-many-write-sync.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - {shard-bmg}:        [FAIL][211] ([Intel XE#2364]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][213] ([Intel XE#1473]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - {shard-bmg}:        [TIMEOUT][215] ([Intel XE#1473]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [FAIL][217] ([Intel XE#2754]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-6/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:
    - {shard-bmg}:        [SKIP][219] ([Intel XE#1130]) -> [PASS][220] +12 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-4/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-1/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][221] ([Intel XE#2105]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_module_load@reload-no-display:
    - {shard-bmg}:        [FAIL][223] ([Intel XE#2136]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@xe_module_load@reload-no-display.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-7/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [FAIL][225] ([Intel XE#2028]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][227] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][229] ([Intel XE#958]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@munmap-style-unbind-front:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1130]) -> [PASS][232] +5 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_vm@munmap-style-unbind-front.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@xe_vm@munmap-style-unbind-front.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1124]) -> [SKIP][234] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1124]) -> [SKIP][236] ([Intel XE#2890])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#367]) -> [SKIP][238] ([Intel XE#2423] / [i915#2575])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][240] ([Intel XE#2351] / [Intel XE#2890])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][242] ([Intel XE#2890])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2890]) -> [SKIP][244] ([Intel XE#455] / [Intel XE#787])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][245] ([Intel XE#1195]) -> [SKIP][246] ([Intel XE#2890])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2423] / [i915#2575]) -> [SKIP][248] ([Intel XE#373])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#373]) -> [SKIP][250] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2423] / [i915#2575]) -> [SKIP][252] ([Intel XE#455])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_content_protection@lic-type-1.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-dg2-set2:     [DMESG-WARN][253] ([Intel XE#1620]) -> [DMESG-WARN][254] ([Intel XE#2932])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_cursor_legacy@torture-move.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][256] ([Intel XE#455])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][258] ([Intel XE#651])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#651]) -> [SKIP][260] ([Intel XE#2890]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#651]) -> [SKIP][262] ([Intel XE#2351] / [Intel XE#2890])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#653]) -> [SKIP][264] ([Intel XE#2890]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2890]) -> [SKIP][266] ([Intel XE#653]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#653]) -> [SKIP][268] ([Intel XE#2351] / [Intel XE#2890])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [DMESG-FAIL][269] ([Intel XE#1620]) -> [FAIL][270] ([Intel XE#2029])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1489]) -> [SKIP][272] ([Intel XE#2890])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][274] ([Intel XE#2890]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2890]) -> [SKIP][276] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_psr@fbc-psr2-basic.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][278] ([Intel XE#2939])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2423] / [i915#2575]) -> [SKIP][280] ([Intel XE#327])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#455]) -> [SKIP][282] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#362]) -> [FAIL][284] ([Intel XE#1729])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#362]) -> [SKIP][286] ([Intel XE#1500])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2168]) -> [SKIP][288] ([Intel XE#2423] / [i915#2575])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_vrr@lobf.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_vrr@lobf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2423] / [i915#2575]) -> [SKIP][290] ([Intel XE#1091] / [Intel XE#2849])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2905]) -> [SKIP][292] ([Intel XE#1130])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@discovery-empty:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#1130]) -> [SKIP][294] ([Intel XE#2905])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_eudebug@discovery-empty.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@xe_eudebug@discovery-empty.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#288]) -> [SKIP][296] ([Intel XE#1130]) +4 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1130]) -> [SKIP][298] ([Intel XE#288]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1130]) -> [SKIP][300] ([Intel XE#255])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#560]) -> [SKIP][302] ([Intel XE#1130])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_media_fill@media-fill.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2541]) -> [SKIP][304] ([Intel XE#1130])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][306] ([Intel XE#1130])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-436/igt@xe_pm@d3cold-basic.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#1130]) -> [ABORT][308] ([Intel XE#1794])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2388
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2461
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2957]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8074 -> IGTPW_11911

  IGTPW_11911: 11911
  IGT_8074: a886e0ad97832dc2ba9b85d35bca22e667c15105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823: 01c7b2c084e5c84313f382734c10945b9aa49823

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/index.html

--===============8959394572298980128==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>xe_find_engine_by_class helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140001/">https://patchwork.freedesktop.org/series/140001/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8074_full -&gt; XEIGTPW_11911_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11911_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11911_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11911_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@core_setmaster@master-drop-set-root.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_vrr@lobf.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8074_full and XEIGTPW_11911_full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11911_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +118 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@kms_cursor_edge_walk@128x128-left-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957">Intel XE#2957</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-1/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-5/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-2/igt@kms_pm_rpm@cursor-dpms.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@kms_psr@pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-7/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-8/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a>) +1 other test timeout</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-3/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-6/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-466/igt@xe_pm@s2idle-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@kms_3d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@kms_addfb_basic@addfb25-bad-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2461">Intel XE#2461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-1/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2388">Intel XE#2388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_cursor_edge_walk@128x128-top-edge.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_cursor_legacy@torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_cursor_legacy@torture-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-d.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-d.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_flip@nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@kms_flip@nonexisting-fb-interruptible.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@kms_plane_alpha_blend@coverage-7efc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-2/igt@kms_plane_alpha_blend@coverage-7efc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-1/igt@kms_properties@connector-properties-legacy.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_psr@fbc-psr2-basic@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-7/igt@kms_psr@fbc-psr2-basic@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-many-write-sync:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-6/igt@xe_dma_buf_sync@export-dma-buf-many-write-sync.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-5/igt@xe_dma_buf_sync@export-dma-buf-many-write-sync.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-6/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-4/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-1/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-bmg-5/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-bmg-7/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@xe_pm@s2idle-d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_vm@munmap-style-unbind-front.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-463/igt@xe_vm@munmap-style-unbind-front.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-435/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-463/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-464/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-436/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-466/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8074/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11911/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8074 -&gt; IGTPW_11911</li>
</ul>
<p>IGTPW_11911: 11911<br />
  IGT_8074: a886e0ad97832dc2ba9b85d35bca22e667c15105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823: 01c7b2c084e5c84313f382734c10945b9aa49823</p>

</body>
</html>

--===============8959394572298980128==--
