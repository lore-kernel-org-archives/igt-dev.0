Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0382AC369C2
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 12:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46C210E2A7;
	Fri, 25 Apr 2025 12:44:12 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342C510E2A7;
 Fri, 25 Apr 2025 12:44:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6483966632850552159=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_benchmarks=3A_Measure_BLT_?=
 =?utf-8?q?performance_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 25 Apr 2025 12:44:11 -0000
Message-ID: <174558505120.11206.10223811404233079066@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424090935.853288-1-pravalika.gurram@intel.com>
In-Reply-To: <20250424090935.853288-1-pravalika.gurram@intel.com>
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

--===============6483966632850552159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: benchmarks: Measure BLT performance (rev2)
URL   : https://patchwork.freedesktop.org/series/148191/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8336_FULL -> XEIGTPW_13036_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13036_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13036_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13036_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-4/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html

  * igt@kms_addfb_basic@bad-pitch-32:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-32.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-bmg:          [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.html

  * igt@kms_sequence@queue-idle@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][9] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_sequence@queue-idle@pipe-b-dp-2.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
New tests
---------

  New tests have been introduced between XEIGT_8336_FULL and XEIGTPW_13036_FULL:

### New IGT tests (1) ###

  * igt@kms_content_protection@srm@pipe-b-dp-2:
    - Statuses : 1 timeout(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13036_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          NOTRUN -> [FAIL][11] ([Intel XE#911]) +3 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#1426])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:
    - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#1426])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2327]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1467])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#607])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#607])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#619])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +6 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2191])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2314] / [Intel XE#2894])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2191])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1512])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#367]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#367]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#367])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +6 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +9 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2907])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#455] / [Intel XE#787]) +34 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#3432])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#3432]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +181 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2669]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][42] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][43] -> [INCOMPLETE][44] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][45] -> [INCOMPLETE][46] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#4418])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#306])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#306])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2252]) +7 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#373]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#373]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][53] ([Intel XE#1178])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2390])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1178]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * {igt@kms_content_protection@srm@pipe-b-dp-2} (NEW):
    - shard-bmg:          NOTRUN -> [TIMEOUT][56] ([Intel XE#4862])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_content_protection@srm@pipe-b-dp-2.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#3278])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#1188]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_content_protection@uevent.html
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2341])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1424]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#308])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2321]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#455]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2320])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#309]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#323])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#2291]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [FAIL][69] ([Intel XE#1475])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][70] -> [FAIL][71] ([Intel XE#4667])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#4354])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2244])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#4422]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4422])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#4422])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2375])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][78] -> [FAIL][79] ([Intel XE#3321]) +2 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][80] ([Intel XE#3321])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1421]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#2316]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2-set2:     [PASS][84] -> [FAIL][85] ([Intel XE#886])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [TIMEOUT][86] ([Intel XE#1504]) +1 other test timeout
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#301])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [PASS][89] -> [FAIL][90] ([Intel XE#2882])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-4/igt@kms_flip@plain-flip-ts-check.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][91] ([Intel XE#2882])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_flip@plain-flip-ts-check@a-dp2.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [PASS][92] -> [FAIL][93] ([Intel XE#886]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1401]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1397] / [Intel XE#1745])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1397])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2293]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#352])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2311]) +19 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#656]) +19 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#4141]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#2231] / [Intel XE#4208])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1469])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#651]) +24 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#651]) +9 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#658])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1158])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2350])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2231] / [Intel XE#4208])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#653]) +21 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2313]) +18 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2312]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2502])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#605])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][118] -> [SKIP][119] ([Intel XE#1503])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#4298])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][121] ([Intel XE#4735])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-lnl:          NOTRUN -> [WARN][122] ([Intel XE#4801])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][123] ([Intel XE#616]) +3 other tests fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#599]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-3/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2763]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#2763]) +7 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2763]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#718])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          NOTRUN -> [FAIL][131] ([Intel XE#718])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#908])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#1489]) +5 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#2893] / [Intel XE#4608]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#4608]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#2893])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1489]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#4609]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1406]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-1/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#2850] / [Intel XE#929]) +14 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#2939])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2414])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-bmg:          [PASS][145] -> [DMESG-FAIL][146] ([Intel XE#3428] / [Intel XE#4689])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2330]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#1127]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1127])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#3414] / [Intel XE#3904])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sequence@queue-idle:
    - shard-bmg:          [PASS][152] -> [FAIL][153] ([Intel XE#4783])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_sequence@queue-idle.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_sequence@queue-idle.html

  * igt@kms_sequence@queue-idle@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][154] ([Intel XE#4783])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_sequence@queue-idle@pipe-d-dp-2.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][155] -> [SKIP][156] ([Intel XE#1435])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#362])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][158] -> [DMESG-WARN][159] ([Intel XE#3428]) +8 other tests dmesg-warn
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2168])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1499])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-3/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#756])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#4837]) +7 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-1/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#4837]) +9 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#4837]) +7 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#688]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2322]) +5 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#1392]) +6 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][170] -> [SKIP][171] ([Intel XE#1392]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#288]) +21 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#2360])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip@invalidinstr-disabled:
    - shard-dg2-set2:     [PASS][174] -> [SKIP][175] ([Intel XE#4208]) +4 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-463/igt@xe_exec_sip@invalidinstr-disabled.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@xe_exec_sip@invalidinstr-disabled.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
    - shard-dg2-set2:     [PASS][176] -> [DMESG-WARN][177] ([Intel XE#3876])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#255])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#2833])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#2838] / [Intel XE#979])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#979])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][184] ([Intel XE#1173]) +1 other test fail
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][185] -> [ABORT][186] ([Intel XE#1794])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-1/igt@xe_pm@s4-basic.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#2284] / [Intel XE#366])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@xe_pm@s4-d3cold-basic-exec.html
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#2284])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#4650])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#944]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#944]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#944])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@xe_query@multigpu-query-topology.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#4814]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#4130])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#4130]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#4130])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#3342]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][198] ([Intel XE#3719] / [Intel XE#911]) -> [PASS][199] +3 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-bmg:          [DMESG-FAIL][200] ([Intel XE#3428]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_atomic_transition@modeset-transition.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_atomic_transition@modeset-transition@1x-outputs:
    - shard-bmg:          [FAIL][202] -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_atomic_transition@modeset-transition@1x-outputs.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_atomic_transition@modeset-transition@1x-outputs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][204] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][206] ([Intel XE#3124]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][208] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-bmg:          [SKIP][210] ([Intel XE#2320]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][212] ([Intel XE#2291]) -> [PASS][213] +3 other tests pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][214] ([Intel XE#4294]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [FAIL][216] ([Intel XE#2882] / [Intel XE#3098]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][218] ([Intel XE#2316]) -> [PASS][219] +6 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
    - shard-dg2-set2:     [FAIL][220] ([Intel XE#886]) -> [PASS][221] +1 other test pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][222] ([Intel XE#3321]) -> [PASS][223] +3 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [DMESG-WARN][224] ([Intel XE#3428]) -> [PASS][225] +13 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][226] ([Intel XE#301]) -> [PASS][227] +2 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][228] ([Intel XE#301]) -> [PASS][229] +1 other test pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#455]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][232] ([Intel XE#4459]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][234] ([Intel XE#1499]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-bmg:          [DMESG-WARN][236] ([Intel XE#1473] / [Intel XE#3428]) -> [PASS][237] +1 other test pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@xe_evict@evict-large-external-cm.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1392]) -> [PASS][239] +6 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [FAIL][240] ([Intel XE#1999]) -> [PASS][241] +2 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][242] ([Intel XE#1794]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@xe_pm@s4-exec-after.html

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [FAIL][244] ([Intel XE#4817]) -> [PASS][245] +1 other test pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-lnl-4/igt@xe_pmu@gt-frequency.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-3/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][247] ([Intel XE#2231] / [Intel XE#4208])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][248] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][249] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][250] ([Intel XE#2341]) -> [FAIL][251] ([Intel XE#1178])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][252] ([Intel XE#1178]) -> [SKIP][253] ([Intel XE#2341]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-2/igt@kms_content_protection@legacy.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][254] ([Intel XE#2341]) -> [TIMEOUT][255] ([Intel XE#4862])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_content_protection@srm.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#308]) -> [SKIP][257] ([Intel XE#4208] / [i915#2575])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [DMESG-WARN][258] ([Intel XE#3428]) -> [SKIP][259] ([Intel XE#2316])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][260] ([Intel XE#2311]) -> [SKIP][261] ([Intel XE#2312]) +12 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][262] ([Intel XE#2312]) -> [SKIP][263] ([Intel XE#2311]) +14 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][264] ([Intel XE#2312]) -> [SKIP][265] ([Intel XE#4141]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][266] ([Intel XE#4141]) -> [SKIP][267] ([Intel XE#2312]) +10 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][268] ([Intel XE#2313]) -> [SKIP][269] ([Intel XE#2312]) +19 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][270] ([Intel XE#2312]) -> [SKIP][271] ([Intel XE#2313]) +19 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1122]) -> [SKIP][273] ([Intel XE#2231] / [Intel XE#4208])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][274] ([Intel XE#2426]) -> [FAIL][275] ([Intel XE#1729])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8336/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
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
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
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
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4735]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4735
  [Intel XE#4783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4783
  [Intel XE#4801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4801
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4862
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8336 -> IGTPW_13036

  IGTPW_13036: 13036
  IGT_8336: 8336
  xe-2994-6176f71822602f52bc4327965090275c5570ed0d: 6176f71822602f52bc4327965090275c5570ed0d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/index.html

--===============6483966632850552159==
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
<tr><td><b>Series:</b></td><td>benchmarks: Measure BLT performance (rev2)</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148191/">https://patchwork.freedesktop.org/series/148191/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13036/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13036/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8336_FULL -&gt; XEIGTPW_13036_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13036_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13036_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
036_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-4/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-=
display-on.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13036/shard-bmg-6/igt@intel_sysfs_debugfs@xe-debugfs-read-a=
ll-entries-display-on.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-32.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bm=
g-6/igt@kms_addfb_basic@bad-pitch-32.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-5/igt@kms_cursor_edge_walk@128x128-top-edge.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036=
/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-top-edge.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13036/shard-dg2-463/igt@kms_flip@2x-wf_vblank-ts-check@ac-hdmi-a6-dp4.=
html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_sequence@queue-idle@pipe-b-d=
p-2.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@xe_fault_injection@probe-fail-gu=
c-xe_guc_ct_send_recv.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8336_FULL and XEIGTPW_13036=
_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_content_protection@srm@pipe-b-dp-2:<ul>
<li>Statuses : 1 timeout(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13036_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-4/igt@kms_async_flips@async-flip-with-=
page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-nonbloc=
king.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13036/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-no=
nblocking.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_atomic_transition@modeset-tr=
ansition-nonblocking@2x-outputs.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2327">Intel XE#2327</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@kms_big_fb@linear-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/146=
7">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-=
offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2=
-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2=
160p.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13036/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3=
840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_bw@connected-linear-tiling=
-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_bw@linear-tiling-3-display=
s-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-=
3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tile=
d-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +181 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel =
XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13036/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#=
4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-b-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13036/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-r=
c-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522"=
>Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_cdclk@mode-transition-all-=
outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_chamelium_color@ctm-negati=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@kms_chamelium_hpd@common-hpd-a=
fter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
3">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@kms_content_protection@atomic-dp=
ms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@kms_content_protection@legacy@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@srm@pipe-b-dp-2} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_content_protection@srm@pipe-=
b-dp-2.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4862">Intel XE#4862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_content_protection@uevent.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1188">Intel XE#1188</a>) +1 other test fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_cursor_crc@cursor-offscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_cursor_crc@cursor-random-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-2/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor=
-atomic-transitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_130=
36/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4667">Intel =
XE#4667</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests=
 fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vbla=
nk@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-1/igt@kms_flip@2x-nonexisting-fb-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/sh=
ard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a=
>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shar=
d-dg2-463/igt@kms_flip@2x-wf_vblank-ts-check.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@kms_flip@bo-too-big-interruptibl=
e@a-edp1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13036/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-4/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bm=
g-8/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_flip@plain-flip-ts-check@a-d=
p2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/s=
hard-lnl-8/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</=
a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-x=
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
/tree/intel-xe/IGTPW_13036/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_force_connector_basic@force-=
connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p=
-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +19 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-i=
ndfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-til=
ing-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdr=
rs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcps=
r-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@kms_frontbuffer_tracking@plane=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-f=
bc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1=
p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1=
p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_getfb@getfb-reject-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
502">Intel XE#2502</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-=
bmg-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_plane@pixel-format-source-cl=
amping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4735">Intel XE#4735</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_plane@pixel-format-source-cl=
amping@pipe-a-plane-0.html">WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4801">Intel XE#4801</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-3/igt@kms_plane_lowres@tiling-none@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-3/igt@kms_plane_scaling@planes-downsca=
le-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@kms_plane_scaling@planes-upsca=
le-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-4/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel=
 XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">In=
tel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress-n=
o-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-1/igt@kms_psr2_sf@pr-cursor-plane-move=
-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-blt@edp-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4609">Intel XE#4609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-1/igt@kms_psr@pr-primary-blt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@kms_psr@psr2-sprite-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13036/shard-bmg-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.ht=
ml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3428">Intel XE#3428</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@kms_rotation_crc@primary-y-til=
ed-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation=
-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-5/igt@kms_sequence@queue-idle.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-6/i=
gt@kms_sequence@queue-idle.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4783">Intel XE#4783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@kms_sequence@queue-idle@pipe-d-d=
p-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4783">Intel XE#4783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13036/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_tiled_display@basic-test-p=
attern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-=
a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13036/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-h=
dmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3428">Intel XE#3428</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_vrr@cmrr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#=
2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-3/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#=
1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_writeback@writeback-check-=
output-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@xe_compute_preempt@compute-pre=
empt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-1/igt@xe_eudebug@basic-close.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837"=
>Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@xe_eudebug@basic-read-event.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@xe_eudebug_online@debugger-reo=
pen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-st=
andalone-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-n=
ull-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13036/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@xe_exec_fault_mode@twice-userp=
tr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner=
-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-disabled:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-463/igt@xe_exec_sip@invalidinstr-disabled.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/s=
hard-dg2-432/igt@xe_exec_sip@invalidinstr-disabled.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-432/igt@xe_exec_threads@threads-hang-userptr-rebind-er=
r.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13036/shard-dg2-435/igt@xe_exec_threads@threads-hang-userptr-rebind-=
err.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@xe_huc_copy@huc_copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">=
Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
3">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@xe_oa@non-privileged-access-va=
ddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-434/igt@xe_oa@syncs-syncobj-wait-cfg.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/283=
8">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979=
">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-=
vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-lnl-1/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-2/igt@xe_pm@=
s4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@xe_pm@s4-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@xe_pm@s4-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sche=
d-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-6/igt@xe_query@multigpu-query-invalid-=
extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-433/igt@xe_query@multigpu-query-topolo=
gy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@xe_render_copy@render-stress-4=
-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4814">Intel XE#4814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@xe_sriov_auto_provisioning@resou=
rces-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@xe_sriov_auto_provisioning@res=
ources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@xe_sriov_auto_provisioning@selfc=
onfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3342">Intel XE#3342</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3719">Intel XE#3719</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-lnl-4/igt@kms_async_flip=
s@async-flip-with-page-flip-events-atomic.html">PASS</a> +3 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-6/igt@kms_atomic_transition@modeset-transition.html">D=
MESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3428">Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_atomic_transition@modeset-trans=
ition.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition@1x-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-6/igt@kms_atomic_transition@modeset-transition@1x-outp=
uts.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13036/shard-bmg-5/igt@kms_atomic_transition@modeset-transition@1x-=
outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-b-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-464/igt@kms_ccs@rando=
m-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4212">Intel XE#4212</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_ccs@rand=
om-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-64x64.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">I=
ntel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13036/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-64x64.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb=
-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">=
Intel XE#4294</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13036/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interru=
ptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2882">Intel XE#2882</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-463/igt@kms_flip@2x=
-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13036/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html=
">PASS</a> +6 other tests pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-432/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886=
">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13036/shard-dg2-433/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-1/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> +3 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel=
 XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13036/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +13 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13036/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-in=
terruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13036/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/sha=
rd-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#445=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_130=
36/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1303=
6/shard-bmg-2/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-6/igt@xe_evict@evict-large-external-cm.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"=
>Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3428">Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@xe_evict@evict-large-external=
-cm.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-dg2-435/igt@xe_exec_basic@=
multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> +6 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1999">Intel XE#1999</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_=
mocs_kernel_kunit.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/sh=
ard-lnl-7/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-lnl-4/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4817">Intel XE#4817</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/sha=
rd-lnl-3/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13036/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard=
-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Int=
el XE#2341</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13036/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-2/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE=
#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13036/shard-bmg-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#234=
1</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-5/igt@kms_content_protection@srm.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#23=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
036/shard-bmg-6/igt@kms_content_protection@srm.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4862">Intel XE#4862=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308=
">Intel XE#308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13036/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">In=
tel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13036/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multi=
draw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13036/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-8/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>=
) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-7/igt@kms_frontbuffer_tracki=
ng@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1=
0 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-mul=
tidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13036/shard-bmg-4/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13036/shard-bmg-2/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#=
1122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13036/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8336/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">I=
ntel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13036/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729=
">Intel XE#1729</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8336 -&gt; IGTPW_13036</li>
</ul>
<p>IGTPW_13036: 13036<br />
  IGT_8336: 8336<br />
  xe-2994-6176f71822602f52bc4327965090275c5570ed0d: 6176f71822602f52bc43279=
65090275c5570ed0d</p>

</body>
</html>

--===============6483966632850552159==--
