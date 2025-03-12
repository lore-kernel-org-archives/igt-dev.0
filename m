Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5FBC28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 20:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459FA10E1A7;
	Wed, 12 Mar 2025 20:56:03 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B455610E0FE;
 Wed, 12 Mar 2025 20:56:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6872695736046441583=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Ffault=5Fi?=
 =?utf-8?q?njection=3A_Test_some_early_probe_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Mar 2025 20:56:01 -0000
Message-ID: <174181296172.26534.6249441275333967679@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250311183833.1199190-1-lucas.demarchi@intel.com>
In-Reply-To: <20250311183833.1199190-1-lucas.demarchi@intel.com>
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

--===============6872695736046441583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Test some early probe functions
URL   : https://patchwork.freedesktop.org/series/146166/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8271_full -> XEIGTPW_12750_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12750_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12750_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12750_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-436/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-4.html

  * {igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early} (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
    - shard-lnl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  
New tests
---------

  New tests have been introduced between XEIGT_8271_full and XEIGTPW_12750_full:

### New IGT tests (4) ###

  * igt@kms_cursor_edge_walk@64x64-right-edge@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.34] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - Statuses : 2 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12750_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1465])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@kms_3d.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#873])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-dg2-set2:     [PASS][7] -> [INCOMPLETE][8] ([Intel XE#2613]) +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#316]) +6 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +13 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#610])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#610])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1428])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124]) +11 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +9 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2191])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2191]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1512])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#367]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#367]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#367]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +17 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +43 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2907]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +17 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +164 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#3432]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#3432]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#3442])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#4212])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#4522])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4522])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#4417]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2724])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#306])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@kms_chamelium_color@ctm-negative.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#306])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2252]) +12 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#373]) +16 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#373]) +12 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#1178]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#1178]) +3 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2341]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2390]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#307])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#307]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#3278]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1424]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#308]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#2321]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2321])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2320]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2291])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2291]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#309]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2286]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#323]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#323]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#309]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#4302])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#4294])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#2244])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_dsc@dsc-with-formats.html
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2244])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#4422]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4422]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#4422]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#776])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#776])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2374])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1135])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2316]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1421]) +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][80] -> [SKIP][81] ([Intel XE#310]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][82] -> [INCOMPLETE][83] ([Intel XE#2049])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][84] ([Intel XE#301]) +3 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#3321]) +2 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#2316]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [TIMEOUT][89] ([Intel XE#1504]) +1 other test timeout
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][90] -> [FAIL][91] ([Intel XE#301]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1401] / [Intel XE#1745]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1401]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2293]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#352])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#651]) +13 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#651]) +35 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2311]) +34 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#4141]) +15 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#656]) +37 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2312]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#658])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#653]) +39 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          [PASS][105] -> [INCOMPLETE][106] ([Intel XE#2050])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2352]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2313]) +33 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#656]) +6 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#4298])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#346])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#346])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#346])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][114] -> [SKIP][115] ([Intel XE#3012])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2934])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2925])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#2934])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2927])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#2927])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2927])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#4359])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          NOTRUN -> [DMESG-FAIL][123] ([Intel XE#324]) +2 other tests dmesg-fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][124] ([Intel XE#324]) +3 other tests dmesg-warn
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][125] ([Intel XE#616]) +3 other tests fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#599]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2493])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     NOTRUN -> [ABORT][128] ([Intel XE#2705] / [Intel XE#4540])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][129] ([Intel XE#4502] / [Intel XE#4540])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#2763]) +19 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#2763]) +5 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2763]) +19 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#870])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          NOTRUN -> [FAIL][135] ([Intel XE#1430])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#908])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1439] / [Intel XE#836])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][138] -> [SKIP][139] ([Intel XE#836])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-432/igt@kms_pm_rpm@dpms-non-lpsp.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#1489]) +9 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#2893]) +7 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1489]) +14 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1122]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1128])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#1406]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2850] / [Intel XE#929]) +21 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1127])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#3414]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#3414] / [Intel XE#3904])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2413])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#1435])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#1435]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1:
    - shard-lnl:          [PASS][155] -> [DMESG-WARN][156] ([Intel XE#324])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-8/igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#2168])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#455]) +25 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2168])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#1499]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1499])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#756]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#1447])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#2905]) +15 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#2905]) +12 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#2905] / [Intel XE#3889])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2905] / [Intel XE#3889])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2905]) +16 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#4518])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#4518])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#4518])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-small:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#688]) +3 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2322]) +8 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-dg2-set2:     [PASS][174] -> [SKIP][175] ([Intel XE#1392]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#1392]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#1392]) +9 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#288]) +31 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#977])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#1420])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#2838] / [Intel XE#979])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#1420] / [Intel XE#2838])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#2245])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#2284] / [Intel XE#366])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#584]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [ABORT][188] ([Intel XE#4268]) +1 other test abort
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-bmg:          NOTRUN -> [ABORT][189] ([Intel XE#4268]) +1 other test abort
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#944]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#944]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#944]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#4130])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#4130]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#4351]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
    - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#4351])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
    - shard-bmg:          NOTRUN -> [SKIP][197] ([Intel XE#4351]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][198] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#2191]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][202] ([Intel XE#2291]) -> [PASS][203] +3 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#309]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][206] ([Intel XE#4354]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#4354]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][210] ([Intel XE#3321]) -> [PASS][211] +4 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#310]) -> [PASS][213] +3 other tests pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][214] ([Intel XE#2316]) -> [PASS][215] +3 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][216] ([Intel XE#301]) -> [PASS][217] +1 other test pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [FAIL][218] ([Intel XE#301]) -> [PASS][219] +1 other test pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#656]) -> [PASS][221] +3 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][222] ([Intel XE#718]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_rmfb@close-fd@pipe-a-edp-1:
    - shard-lnl:          [DMESG-WARN][224] ([Intel XE#324]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-2/igt@kms_rmfb@close-fd@pipe-a-edp-1.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_rmfb@close-fd@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1392]) -> [PASS][227] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - shard-dg2-set2:     [INCOMPLETE][228] -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-435/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [FAIL][230] ([Intel XE#1999]) -> [PASS][231] +2 other tests pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-436/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [SKIP][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257]) ([Intel XE#378]) -> ([PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-8/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-4/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-5/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-3/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-8/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-2/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-2/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-2/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-7/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-7/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-3/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-6/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-5/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-5/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-1/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-1/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-1/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-1/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-4/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-4/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-3/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-6/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-6/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-3/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-7/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-8/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-2/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [SKIP][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303]) ([Intel XE#2457]) -> ([PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-2/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-2/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-6/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-6/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-4/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-6/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-6/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-4/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-4/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-4/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-7/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-7/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-4/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-2/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-6/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-7/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([SKIP][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349]) ([Intel XE#378]) -> ([PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-436/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-435/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-434/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-435/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-434/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-432/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-432/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-466/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-466/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-466/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-466/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-463/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-435/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-433/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-433/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-436/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-436/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-436/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-463/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-434/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-432/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-463/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][376] ([Intel XE#787]) +3 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#787]) -> [SKIP][378] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][379] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][380] ([Intel XE#2705] / [Intel XE#4345])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#455]) -> [FAIL][382] ([Intel XE#1178])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@kms_content_protection@legacy.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][383] ([Intel XE#3321]) -> [INCOMPLETE][384] ([Intel XE#2049])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][385] ([Intel XE#2311]) -> [SKIP][386] ([Intel XE#2312]) +12 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][387] ([Intel XE#2312]) -> [SKIP][388] ([Intel XE#2311]) +8 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][389] ([Intel XE#2312]) -> [SKIP][390] ([Intel XE#4141]) +6 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][391] ([Intel XE#4141]) -> [SKIP][392] ([Intel XE#2312]) +6 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#651]) -> [SKIP][394] ([Intel XE#656]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#656]) -> [SKIP][396] ([Intel XE#651]) +4 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#653]) -> [SKIP][398] ([Intel XE#656])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#656]) -> [SKIP][400] ([Intel XE#653]) +6 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][401] ([Intel XE#2313]) -> [SKIP][402] ([Intel XE#2312]) +8 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][403] ([Intel XE#2312]) -> [SKIP][404] ([Intel XE#2313]) +7 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#362]) -> [SKIP][406] ([Intel XE#1500])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][407] ([Intel XE#1173]) -> [SKIP][408] ([Intel XE#1061])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@xe_peer2peer@read.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [ABORT][409] -> [ABORT][410] ([Intel XE#4268])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-434/igt@xe_pm@s4-basic.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@xe_pm@s4-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8271 -> IGTPW_12750
  * Linux: xe-2797-eb17816e52395a403aa0b447aa0befa9d2f86dd5 -> xe-2798-aba848f9b752cf51474c0c3b1abcf0f572f774dc

  IGTPW_12750: 12750
  IGT_8271: 8271
  xe-2797-eb17816e52395a403aa0b447aa0befa9d2f86dd5: eb17816e52395a403aa0b447aa0befa9d2f86dd5
  xe-2798-aba848f9b752cf51474c0c3b1abcf0f572f774dc: aba848f9b752cf51474c0c3b1abcf0f572f774dc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/index.html

--===============6872695736046441583==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Test some ea=
rly probe functions</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146166/">https://patchwork.freedesktop.org/series/146166/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12750/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12750/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8271_full -&gt; XEIGTPW_12750_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12750_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12750_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
750_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-436/igt@kms_atomic_transition@plane-all-transition-fen=
cing@pipe-a-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@kms_atomic_transition@plane-a=
ll-transition-fencing@pipe-a-dp-4.html">INCOMPLETE</a> +1 other test incomp=
lete</li>
</ul>
</li>
<li>
<p>{igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_earl=
y} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@xe_fault_injection@inject-faul=
t-probe-function-xe_device_probe_early.html">FAIL</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_fault_injection@inject-fault-=
probe-function-xe_device_probe_early.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8271_full and XEIGTPW_12750=
_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@64x64-right-edge@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early=
:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12750_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@kms_3d.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_async_flips@invalid-async-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonbl=
ocking.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12750/shard-dg2-433/igt@kms_atomic_transition@modeset-transitio=
n-nonblocking.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2613">Intel XE#2613</a>) +1 other test incomplete</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_big_fb@y-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/610">Intel XE#610</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-=
overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/610">Intel XE#610</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 othe=
r tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other te=
st skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_bw@connected-linear-tiling=
-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4=
-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_bw@linear-tiling-1-display=
s-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_ccs@bad-aux-stride-y-tiled-g=
en12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled=
-gen12-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +43 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-=
gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-ti=
led-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +164 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-=
tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12750/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-m=
c-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Inte=
l XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel =
XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe=
-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724=
">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@kms_chamelium_color@ctm-negative=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_chamelium_color@ctm-negati=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-chang=
e-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-wit=
h-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-enable=
-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_content_protection@atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_content_protection@atomic-=
dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2341">Intel XE#2341</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_content_protection@dp-mst-=
type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-mo=
vement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-v=
s-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs=
-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_cursor_legacy@2x-long-nonbloc=
king-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking=
-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +2 other tests sk=
ip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-f=
lip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test ski=
p</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12750/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750=
/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4=
302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
4">Intel XE#2244</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
4">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
6">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@kms_feature_discovery@psr2.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_flip@2x-absolute-wf_vblank-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/sha=
rd-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@ac-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12750/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi=
-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12750/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@kms_flip@bo-too-big-interruptibl=
e@a-edp1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-inte=
rruptible@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>=
) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-2/igt@kms_force_connector_basic@prune-=
stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rg=
b565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +15 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +37 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +39 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-=
indfb-fullscreen.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-spr-indfb-fullscreen.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +33 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_joiner@basic-max-non-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_joiner@invalid-modeset-big=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12750/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012=
">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_joiner@invalid-modeset-for=
ce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@kms_joiner@invalid-modeset-ult=
ra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb888=
8-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_plane@plane-position-hole.ht=
ml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_plane@plane-position-hole@pi=
pe-b-plane-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_plane_lowres@tiling-x@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_plane_scaling@intel-max-sr=
c-size.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4502">Intel XE#4502</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_plane_scaling@planes-downs=
cale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">I=
ntel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Int=
el XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">I=
ntel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-432/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-=
464/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2893">Intel XE#2893</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/929">Intel XE#929</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-n=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1435">Intel XE#1435</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-lnl-8/igt@kms_universal_plane@universal-plane-functional@p=
ipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12750/shard-lnl-5/igt@kms_universal_plane@universal-plane-=
functional@pipe-a-edp-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_vrr@cmrr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel X=
E#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#=
2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"=
>Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@xe_compute@ccs-mode-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
47">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-exten=
ded-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2905">Intel XE#2905</a>) +15 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-extende=
d-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2905">Intel XE#2905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-=
delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_eudebug_online@single-step.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2905">Intel XE#2905</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@xe_eudebug_sriov@deny-eudebug.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4518">Intel XE#4518</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@xe_eudebug_sriov@deny-eudebug.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_evict@evict-beng-small.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
8">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-r=
ebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12750/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecq=
ueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec=
-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_exec_fault_mode@many-userpt=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/288">Intel XE#288</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_oa@polling-small-buf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">=
Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
8">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/979">Intel XE#979</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">=
Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_pm@d3cold-basic-exec.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284=
">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_pm@s3-multiple-execs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584"=
>Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_pm@s4-d3hot-basic-exec.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4268">Intel XE#4268</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_pm@s4-vm-bind-prefetch.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
268">Intel XE#4268</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@xe_query@multigpu-query-invalid-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@xe_query@multigpu-query-oa-uni=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-ve=
rsion-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_sriov_auto_provisioning@selfc=
onfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_sriov_auto_provisioning@selfc=
onfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@xe_sriov_scheduling@nonpreempt=
-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4351">Intel XE#4351</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@xe_sriov_scheduling@nonpreempt-e=
ngine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4351">Intel XE#4351</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@xe_sriov_scheduling@nonpreempt-e=
ngine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4351">Intel XE#4351</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_bw@connecte=
d-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920=
x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@kms_bw@connected-linear-t=
iling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12750/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-leg=
acy.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tran=
sitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms_cursor_legacy@cursora-=
vs-flipb-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Inte=
l XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12750/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>=
</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">In=
tel XE#4354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12750/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> +4 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#3=
10</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
750/shard-dg2-434/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +3 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12750/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</=
a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
c-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@kms_flip@flip-vs-expired=
-vblank-interruptible@c-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/igt@kms_frontbuffer_trac=
king@fbc-2p-primscrn-pri-shrfb-draw-blt.html">PASS</a> +3 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-=
lnl-3/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-lnl-2/igt@kms_rmfb@close-fd@pipe-a-edp-1.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">In=
tel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12750/shard-lnl-6/igt@kms_rmfb@close-fd@pipe-a-edp-1.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexec=
queue.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-435/igt@xe_exec_compute_mode@many-userptr-invalidate-r=
ace.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12750/shard-dg2-434/igt@xe_exec_compute_mode@many-userptr-in=
validate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-436/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1999">Intel XE#1999</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_=
mocs_kernel_kunit.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8271/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8271/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8271/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8271/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8271/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8271/shard-lnl-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-ln=
l-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8271/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard=
-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/sh=
ard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
271/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-3/igt@xe_module_load@l=
oad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8271/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8271/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8271/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750=
/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12750/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12750/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard=
-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
750/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12750/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12750/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/sh=
ard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12750/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12750/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12750/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-ln=
l-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12750/shard-lnl-4/igt@xe_module_load@load.html"=
>PASS</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8271/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8271/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8271/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8271/shard-bmg-8/igt@xe_module_load@load.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8271/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bm=
g-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8271/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard=
-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
271/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2457">Intel XE#2457</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12750/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12750/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12750/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12750/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
750/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8271/shard-dg2-436/igt@xe_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-435/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8271/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-435=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8271/shard-dg2-434/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-=
dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-466/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8271/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-466/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8271/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8271/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-43=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8271/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_827=
1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-463/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8271/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8271/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-464/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8271/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12750/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-=
434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_127=
50/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12750/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-433/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12750/shard-dg2-435/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/sh=
ard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12750/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12750/shard-dg2-466/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-d=
g2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12750/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12750/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-46=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750=
/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-463/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12750/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-=
cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-434/igt@kms=
_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Inte=
l XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_ccs@bad-rotatio=
n-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-436/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345"=
>Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12750/shard-dg2-434/igt@kms_content_protection@legacy.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1=
178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-2/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-i=
ndfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pr=
i-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-464/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sh=
rfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-432/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12750/shard-bmg-7/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/362">Intel XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-464/igt@xe_peer2peer@read.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/sha=
rd-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8271/shard-dg2-434/igt@xe_pm@s4-basic.html">ABORT</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12750/shard-dg2-466/igt=
@xe_pm@s4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8271 -&gt; IGTPW_12750</li>
<li>Linux: xe-2797-eb17816e52395a403aa0b447aa0befa9d2f86dd5 -&gt; xe-2798-a=
ba848f9b752cf51474c0c3b1abcf0f572f774dc</li>
</ul>
<p>IGTPW_12750: 12750<br />
  IGT_8271: 8271<br />
  xe-2797-eb17816e52395a403aa0b447aa0befa9d2f86dd5: eb17816e52395a403aa0b44=
7aa0befa9d2f86dd5<br />
  xe-2798-aba848f9b752cf51474c0c3b1abcf0f572f774dc: aba848f9b752cf51474c0c3=
b1abcf0f572f774dc</p>

</body>
</html>

--===============6872695736046441583==--
