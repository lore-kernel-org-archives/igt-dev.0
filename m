Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3ADE69EA6
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 15:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C29B10E081;
	Tue,  3 Dec 2024 15:32:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94B810E081;
 Tue,  3 Dec 2024 15:32:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3569613382172934096=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_hibernate_helpers_and_?=
 =?utf-8?q?kms=5Fccs_hibernate_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Dec 2024 15:32:55 -0000
Message-ID: <173323997594.2053142.12391934304635380834@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241203092418.3454357-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241203092418.3454357-1-juhapekka.heikkila@gmail.com>
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

--===============3569613382172934096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add hibernate helpers and kms_ccs hibernate test
URL   : https://patchwork.freedesktop.org/series/142035/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8135_full -> XEIGTPW_12233_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12233_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12233_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12233_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-lnl:          NOTRUN -> ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-5/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-4/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-3/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-4/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-3/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-3/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-4/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-4/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-8/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-3/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-8/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-8/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-8/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-1/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-1/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-5/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-5/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-1/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-7/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-7/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-7/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-7/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-5/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-1/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-4/igt@runner@aborted.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [PASS][26] -> [INCOMPLETE][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][28]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48], [FAIL][49], [FAIL][50], [FAIL][51], [FAIL][52], [FAIL][53])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-434/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-435/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-436/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-435/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-436/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-436/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-435/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-436/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-436/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-435/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-435/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-436/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-435/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-466/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-466/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-466/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-466/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-466/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-466/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-434/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-434/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-434/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-434/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-434/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-434/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12233_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][54] -> [DMESG-WARN][55] ([Intel XE#3467] / [Intel XE#3468])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-2/igt@core_hotunplug@hotreplug.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@core_hotunplug@hotreplug.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2385])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2327]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#610])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1124]) +16 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#607]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#2314] / [Intel XE#2894])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#367]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2887]) +21 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#3432]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2325])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2252]) +19 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_color@ctm-0-75:
    - shard-bmg:          [PASS][70] -> [DMESG-WARN][71] ([Intel XE#877]) +1 other test dmesg-warn
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-8/igt@kms_color@ctm-0-75.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_color@ctm-0-75.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][72] ([Intel XE#1178]) +1 other test fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][73] ([Intel XE#1188]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2320]) +9 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2321]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2286]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2323])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2244]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#776])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2373])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#1138])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2375])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2374])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][84] ([Intel XE#2882]) +2 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][85] ([Intel XE#3321]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          [PASS][86] -> [SKIP][87] ([Intel XE#2316]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2316])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][89] ([Intel XE#3468]) +26 other tests dmesg-warn
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][90] -> [DMESG-FAIL][91] ([Intel XE#1727] / [Intel XE#3468]) +5 other tests dmesg-fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:
    - shard-bmg:          [PASS][92] -> [DMESG-FAIL][93] ([Intel XE#3468]) +5 other tests dmesg-fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2293]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2312]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][97] ([Intel XE#2333]) +20 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2311]) +39 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2352])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2313]) +40 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][101] ([Intel XE#1727] / [Intel XE#3468])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2927]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2393])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2493])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][105] ([Intel XE#2705] / [Intel XE#3468])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2763]) +14 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#870])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#1489]) +8 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2387])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2234] / [Intel XE#2850]) +20 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2414])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#3414])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2413])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [PASS][114] -> [INCOMPLETE][115] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-7/igt@kms_sequence@get-idle.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_sequence@get-idle.html

  * igt@kms_sequence@queue-busy@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][116] -> [INCOMPLETE][117] ([Intel XE#1727]) +1 other test incomplete
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-7/igt@kms_sequence@queue-busy@pipe-a-hdmi-a-3.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_sequence@queue-busy@pipe-a-hdmi-a-3.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#1435])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2426])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2450])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@query-idle@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][121] -> [DMESG-WARN][122] ([Intel XE#3468]) +38 other tests dmesg-warn
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-7/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html

  * igt@kms_vblank@wait-forked@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][123] ([Intel XE#3468]) +8 other tests dmesg-fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_vblank@wait-forked@pipe-a-dp-2.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2168])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#1499]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2905]) +11 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][127] -> [INCOMPLETE][128] ([Intel XE#1473] / [Intel XE#3468])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][129] ([Intel XE#1473])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [TIMEOUT][130] ([Intel XE#1473] / [Intel XE#2472])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:
    - shard-bmg:          [PASS][131] -> [DMESG-WARN][132] ([Intel XE#1727])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-4/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2322]) +11 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][134] ([Intel XE#3467] / [Intel XE#3468])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [PASS][135] -> [DMESG-WARN][136] ([Intel XE#3343]) +1 other test dmesg-warn
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [PASS][137] -> [DMESG-WARN][138] ([Intel XE#3467]) +1 other test dmesg-warn
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#586])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_mmap@small-bar.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#1420])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-bmg:          [PASS][141] -> [DMESG-WARN][142] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests dmesg-warn
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-5/igt@xe_pm@d3hot-mmap-system.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2284]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#579])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#944]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_vm@munmap-style-unbind-userptr-many-end:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][146] ([Intel XE#1727]) +1 other test dmesg-warn
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@xe_vm@munmap-style-unbind-userptr-many-end.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][147] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_cursor_crc@cursor-onscreen-128x128:
    - shard-bmg:          [DMESG-FAIL][149] ([Intel XE#3468]) -> [PASS][150] +11 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-128x128.html

  * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][151] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][153] ([Intel XE#2291]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][155] ([Intel XE#3468] / [Intel XE#877]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@single-move:
    - shard-bmg:          [INCOMPLETE][157] ([Intel XE#3226]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-8/igt@kms_cursor_legacy@single-move.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_cursor_legacy@single-move.html

  * igt@kms_cursor_legacy@single-move@pipe-d:
    - shard-bmg:          [INCOMPLETE][159] -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-8/igt@kms_cursor_legacy@single-move@pipe-d.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_cursor_legacy@single-move@pipe-d.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-bmg:          [DMESG-WARN][161] ([Intel XE#877]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-5/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][163] ([Intel XE#2316]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][165] ([Intel XE#2882]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          [FAIL][167] ([Intel XE#3674]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - shard-bmg:          [FAIL][169] ([Intel XE#3559]) -> [PASS][170] +3 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-3/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html

  * igt@kms_vblank@query-forked@pipe-d-dp-2:
    - shard-bmg:          [DMESG-WARN][171] ([Intel XE#3468]) -> [PASS][172] +50 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-2/igt@kms_vblank@query-forked@pipe-d-dp-2.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@kms_vblank@query-forked@pipe-d-dp-2.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [DMESG-WARN][173] ([Intel XE#3467] / [Intel XE#3468]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_pm@s3-basic-exec:
    - shard-bmg:          [DMESG-WARN][175] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-2/igt@xe_pm@s3-basic-exec.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          [DMESG-WARN][177] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][178] +5 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-3/igt@xe_pm@s4-exec-after.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [DMESG-FAIL][179] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][180] +4 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [DMESG-WARN][181] ([Intel XE#3467]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][183] ([Intel XE#2312]) -> [SKIP][184] ([Intel XE#2311]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [FAIL][185] ([Intel XE#2333]) -> [DMESG-FAIL][186] ([Intel XE#3468])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [DMESG-FAIL][187] ([Intel XE#3468]) -> [FAIL][188] ([Intel XE#2333]) +11 other tests fail
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [FAIL][189] ([Intel XE#2333]) -> [SKIP][190] ([Intel XE#2312])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][191] ([Intel XE#2312]) -> [FAIL][192] ([Intel XE#2333]) +4 other tests fail
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][193] ([Intel XE#2311]) -> [SKIP][194] ([Intel XE#2312]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][195] ([Intel XE#2313]) -> [SKIP][196] ([Intel XE#2312]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [FAIL][197] ([Intel XE#2333]) -> [INCOMPLETE][198] ([Intel XE#1727] / [Intel XE#2050] / [Intel XE#3468])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][199] ([Intel XE#2312]) -> [SKIP][200] ([Intel XE#2313]) +4 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][201] ([Intel XE#3544]) -> [SKIP][202] ([Intel XE#3374] / [Intel XE#3544])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-bmg:          [ABORT][203] ([Intel XE#3673]) -> [ABORT][204] ([Intel XE#3468] / [Intel XE#3673]) +2 other tests abort
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [DMESG-WARN][205] ([Intel XE#3343]) -> [DMESG-WARN][206] ([Intel XE#3343] / [Intel XE#3468])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-WARN][207] -> [DMESG-WARN][208] ([Intel XE#3467])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][209] ([Intel XE#2833]) -> [SKIP][210] ([Intel XE#1192])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_module_load@load:
    - shard-bmg:          [SKIP][211] ([Intel XE#2457]) -> ([PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [SKIP][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237]) ([Intel XE#2457])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-5/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-bmg:          [ABORT][238] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#3673]) -> [ABORT][239] ([Intel XE#3673])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [ABORT][240] ([Intel XE#3468] / [Intel XE#3673]) -> [ABORT][241] ([Intel XE#3673]) +1 other test abort
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8135/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
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
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3673]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673
  [Intel XE#3674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3674
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8135 -> IGTPW_12233
  * Linux: xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824 -> xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219

  IGTPW_12233: 6c12ec492cf98f6ad9679b4ceb6dff08304c3b61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8135: c6840f5e3c3b942aa79727ee4978a5b79f290b67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824: 4de82d50b8de6a278c1483a7f76ae830c89d1824
  xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219: 5779fb3c12faf12589054127d60b1d36d56ba219

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/index.html

--===============3569613382172934096==
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
<tr><td><b>Series:</b></td><td>Add hibernate helpers and kms_ccs hibernate =
test</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142035/">https://patchwork.freedesktop.org/series/142035/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12233/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12233/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8135_full -&gt; XEIGTPW_12233_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12233_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12233_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
233_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12233/shard-lnl-5/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-=
4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-lnl-3/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-4=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12233/shard-lnl-3/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-3/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12233/shard-lnl-4/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-4/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12233/shard-lnl-8/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-3/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12233/shard-lnl-8/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-8/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12233/shard-lnl-8/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-1/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12233/shard-lnl-1/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-5/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12233/shard-lnl-5/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-1/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12233/shard-lnl-7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-7/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12233/shard-lnl-7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-7/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12233/shard-lnl-5/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-lnl-1/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12233/shard-lnl-4/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0=
-vram01-vram01.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-comp=
ressed-compfmt0-vram01-vram01.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_exec_threads@threads-hang-use=
rptr-invalidate-race.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12233/shard-dg2-434/igt@xe_module_load@load.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/sha=
rd-dg2-435/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-436/igt@xe_module_load@l=
oad.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12233/shard-dg2-435/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-436/igt@xe_=
module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12233/shard-dg2-436/igt@xe_module_load@load.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg=
2-435/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-436/igt@xe_module_load@load.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2233/shard-dg2-436/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-435/igt@xe_modul=
e_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12233/shard-dg2-435/igt@xe_module_load@load.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-436=
/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12233/shard-dg2-435/igt@xe_module_load@load.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/=
shard-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-466/igt@xe_module_loa=
d@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12233/shard-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-466/igt=
@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-dg2-466/igt@xe_module_load@load.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shar=
d-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-434/igt@xe_module_load@lo=
ad.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12233/shard-dg2-434/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-434/igt@xe_m=
odule_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12233/shard-dg2-434/igt@xe_module_load@load.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-dg2=
-434/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12233/shard-dg2-434/igt@xe_module_load@load.ht=
ml">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12233_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-2/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/=
igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12233/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1=
920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled=
-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_chamelium_color@ctm-0-25.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-chang=
e-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-8/igt@kms_color@ctm-0-75.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@k=
ms_color@ctm-0-75.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@kms_content_protection@srm@pipe-=
a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_content_protection@uevent.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_display_modes@mst-extended-m=
ode-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
6">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_feature_discovery@display-2x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg=
-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@=
c-dp2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a>) +26 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1223=
3/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">In=
tel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3468">Intel XE#3468</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12233/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a=
3.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +20 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +39 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte@pipe-b-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2927">Intel XE#2927</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
93">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-=
20x20-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@kms_psr@psr2-no-drrs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_rotation_crc@primary-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-n=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-7/igt@kms_sequence@get-idle.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt=
@kms_sequence@get-idle.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 =
other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-7/igt@kms_sequence@queue-busy@pipe-a-hdmi-a-3.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_122=
33/shard-bmg-6/igt@kms_sequence@queue-busy@pipe-a-hdmi-a-3.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">=
Intel XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-7/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233=
/shard-bmg-4/igt@kms_vblank@query-idle@pipe-a-hdmi-a-3.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) +38 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_vblank@wait-forked@pipe-a-dp=
-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3468">Intel XE#3468</a>) +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#=
2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@xe_eudebug@vm-bind-clear.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12233/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_evict@evict-mixed-many-thread=
s-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@xe_evict@evict-mixed-many-thread=
s-small.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-4/igt@xe_exec_balancer@many-execqueues-cm-parallel-use=
rptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12233/shard-bmg-6/igt@xe_exec_balancer@many-execqueues-cm-paralle=
l-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_fault_injection@inject-fault-=
probe-function-xe_device_create.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-x=
e_guc_ct_init.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12233/shard-bmg-6/igt@xe_fault_injection@inject-fault-pr=
obe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +1 other tes=
t dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops=
_prepare.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12233/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_u=
pdate_ops_prepare.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_mmap@small-bar.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel=
 XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-5/igt@xe_pm@d3hot-mmap-system.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/i=
gt@xe_pm@d3hot-mmap-system.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)=
 +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@xe_query@multigpu-query-invalid-=
cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-many-end:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@xe_vm@munmap-style-unbind-userpt=
r-many-end.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_bw@connecte=
d-linear-tiling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-128x12=
8.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp=
-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_cursor_=
crc@cursor-onscreen-128x128@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@kms_cursor_legacy@2x-non=
blocking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_cursor_legacy@curs=
orb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-8/igt@kms_cursor_legacy@single-move.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">In=
tel XE#3226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12233/shard-bmg-5/igt@kms_cursor_legacy@single-move.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-8/igt@kms_cursor_legacy@single-move@pipe-d.html">INCOM=
PLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12233/shard-bmg-5/igt@kms_cursor_legacy@single-move@pipe-d.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-5/igt@kms_cursor_legacy@torture-move@pipe-b.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
877">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12233/shard-bmg-4/igt@kms_cursor_legacy@torture-move@pipe-b.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2882">Intel XE#2882</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-inte=
rruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-=
dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3674">Intel XE#3674</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-3/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3559">Inte=
l XE#3559</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12233/shard-bmg-3/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">PASS</a>=
 +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-2/igt@kms_vblank@query-forked@pipe-d-dp-2.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12233/shard-bmg-2/igt@kms_vblank@query-forked@pipe-d-dp-2.html=
">PASS</a> +50 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_s=
cratch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_faul=
t_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-2/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#172=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468=
">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@xe_pm@s3-basic-exec.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-3/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#172=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468=
">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12233/shard-bmg-2/igt@xe_pm@s4-exec-after.html">PASS</a> +5 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"=
>Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@=
gt1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Int=
el XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12233/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shr=
fb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbc-1p-offscren-pri-shrfb-draw-render.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-ind=
fb-draw-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@kms_frontbuffer_=
tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1=
1 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-m=
sflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-ind=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">=
Intel XE#2333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12233/shard-bmg-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2050">Intel XE#2050</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2233/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0=
-system-vram01.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3673">Intel XE#3673</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_ccs@suspend-res=
ume@linear-compressed-compfmt0-system-vram01.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673">Intel=
 XE#3673</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-x=
e_guc_relay_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_fault_in=
jection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel=
 XE#3343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc=
.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12233/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_vma_op=
s_alloc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1223=
3/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-5/igt@xe_module_load@load.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12233/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12233/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bm=
g-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/igt@xe_module_load@load.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12233/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12233/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12233/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard=
-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
233/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12233/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12233/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12233/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE=
#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3468">Intel XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3673">Intel XE#3673</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_pm_residency@gt-c6-fr=
eeze.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3673">Intel XE#3673</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8135/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3673">Intel XE#3673</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12233/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt0.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3673">Intel XE#3673</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8135 -&gt; IGTPW_12233</li>
<li>Linux: xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824 -&gt; xe-2310-5=
779fb3c12faf12589054127d60b1d36d56ba219</li>
</ul>
<p>IGTPW_12233: 6c12ec492cf98f6ad9679b4ceb6dff08304c3b61 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8135: c6840f5e3c3b942aa79727ee4978a5b79f290b67 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2307-4de82d50b8de6a278c1483a7f76ae830c89d1824: 4de82d50b8de6a278c1483a=
7f76ae830c89d1824<br />
  xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219: 5779fb3c12faf1258905412=
7d60b1d36d56ba219</p>

</body>
</html>

--===============3569613382172934096==--
