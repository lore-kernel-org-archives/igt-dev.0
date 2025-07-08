Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EAEC8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 23:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FCA10E6F2;
	Tue,  8 Jul 2025 23:30:43 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EEF10E6F2;
 Tue,  8 Jul 2025 23:30:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7624624541189359541=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_runner=3A_Relax_timeout_re?=
 =?utf-8?q?duction_on_soft_lockup_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 08 Jul 2025 23:30:42 -0000
Message-ID: <175201744233.145913.12212513859008781745@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250708130437.917619-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20250708130437.917619-2-janusz.krzysztofik@linux.intel.com>
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

--===============7624624541189359541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Relax timeout reduction on soft lockup (rev2)
URL   : https://patchwork.freedesktop.org/series/151190/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8447_FULL -> XEIGTPW_13431_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13431_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13431_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13431_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-lnl-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  
#### Warnings ####

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-dg2-set2:     [SKIP][5] ([Intel XE#4208]) -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13431_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#2134])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@fbdev@eof.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@fbdev@eof.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:
    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#4208] / [Intel XE#4618]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#911]) +3 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#873])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#873])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-6/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2327])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#367]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#367])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#367]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +181 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#3442]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#3432])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#3432])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][31] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#373]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#4208] / [i915#2575]) +23 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2252]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#373]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1178]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#1178])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2320]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1424])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-5/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#308])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-bmg:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#5354])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#2291]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2291])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#309]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#323])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2286])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2244])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2244])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2316]) +6 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2316]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1421]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#301]) +4 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#4208]) +203 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][61] -> [SKIP][62] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#455]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#651]) +6 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#651]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2312]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2311]) +7 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#5390]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#656]) +6 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#653]) +6 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#5426])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2313]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][73] -> [FAIL][74] ([Intel XE#616]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#616]) +2 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#599]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-3/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2393])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#870])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#718]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2505])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html
    - shard-lnl:          NOTRUN -> [FAIL][82] ([Intel XE#2029])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1439] / [Intel XE#3141])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#2893])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1489]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#4608])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#1489]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2387])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1122])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1128])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-3/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1406])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [FAIL][95] ([Intel XE#4689])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#4208] / [i915#2575]) +87 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-180.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2413])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#1499])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_vrr@flip-basic.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1280] / [Intel XE#455])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#5249])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_configfs@survivability-mode.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#4837]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#4837]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#4837]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-5/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-small-cm:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#688])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2322]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1392]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1392])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [PASS][109] -> [SKIP][110] ([Intel XE#1392]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-435/igt@xe_exec_basic@multigpu-once-rebind.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#288]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2360])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][113] -> [DMESG-WARN][114] ([Intel XE#3876])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#4208]) +72 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#4943]) +7 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@once-mmap-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#4915]) +71 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_exec_system_allocator@once-mmap-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#4943]) +10 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-7/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - shard-lnl:          [PASS][119] -> [FAIL][120] ([Intel XE#5018])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][121] -> [SKIP][122] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-432/igt@xe_live_ktest@xe_bo.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-dg2-set2:     [PASS][123] -> [SKIP][124] ([Intel XE#2229])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-432/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][125] -> [FAIL][126] ([Intel XE#4208])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-464/igt@xe_module_load@reload.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_module_load@reload.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#579])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#584])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#4733])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#944])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4351])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_sriov_scheduling@equal-throughput.html
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4351])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@xe_sriov_scheduling@equal-throughput.html
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#4351])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-7/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#2134]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@fbdev@read.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@fbdev@read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][137] ([Intel XE#911]) -> [PASS][138] +3 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-dg2-set2:     [FAIL][139] -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_async_flips@test-time-stamp.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#4208] / [i915#2575]) -> [PASS][142] +100 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][143] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][145] ([Intel XE#2291]) -> [PASS][146] +3 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][147] ([Intel XE#4633]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@fill-fb:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][150] +10 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_draw_crc@fill-fb.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][151] ([Intel XE#2316]) -> [PASS][152] +8 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][153] ([Intel XE#4596]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][155] ([Intel XE#718]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][157] ([Intel XE#2883]) -> [PASS][158] +2 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-5/igt@kms_setmode@basic.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1392]) -> [PASS][160] +2 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][161] ([Intel XE#3876]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][163] ([Intel XE#5018]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - shard-dg2-set2:     [DMESG-WARN][165] ([Intel XE#3876]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-rebind.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_exec_threads@threads-hang-userptr-rebind.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][167] ([Intel XE#4208]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_module_load@reload-no-display.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_module_load@reload-no-display.html

  * igt@xe_vm@invalid-extensions:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#4208]) -> [PASS][170] +191 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_vm@invalid-extensions.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_vm@invalid-extensions.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#4208] / [i915#2575]) -> [SKIP][172] ([Intel XE#623])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#4208] / [i915#2575]) -> [SKIP][174] ([Intel XE#3768])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-atomic.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][176] ([Intel XE#316])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#316]) -> [SKIP][178] ([Intel XE#4208]) +6 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#316]) -> [SKIP][180] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#4208]) -> [SKIP][182] ([Intel XE#316]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][184] ([Intel XE#1124]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][186] ([Intel XE#619])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#4208]) -> [SKIP][188] ([Intel XE#610])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1124]) -> [SKIP][190] ([Intel XE#4208]) +7 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#4208]) -> [SKIP][192] ([Intel XE#1124]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1124]) -> [SKIP][194] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2191]) -> [SKIP][196] ([Intel XE#4208] / [i915#2575])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#4208] / [i915#2575]) -> [SKIP][198] ([Intel XE#2191]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#367]) -> [SKIP][200] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#4208] / [i915#2575]) -> [SKIP][202] ([Intel XE#367]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][204] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][206] ([Intel XE#4208]) +13 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#4208]) -> [SKIP][208] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][210] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][211] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][212] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#4208]) -> [INCOMPLETE][214] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#4208]) -> [SKIP][216] ([Intel XE#2907]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#4208] / [i915#2575]) -> [SKIP][218] ([Intel XE#306]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#306]) -> [SKIP][220] ([Intel XE#4208] / [i915#2575])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-433/igt@kms_chamelium_color@gamma.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#4208] / [i915#2575]) -> [SKIP][222] ([Intel XE#373]) +12 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#373]) -> [SKIP][224] ([Intel XE#4208] / [i915#2575]) +9 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#4208] / [i915#2575]) -> [FAIL][226] ([Intel XE#1178])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_content_protection@atomic.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][227] ([Intel XE#1178]) -> [SKIP][228] ([Intel XE#4208] / [i915#2575])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
    - shard-bmg:          [FAIL][229] ([Intel XE#1178]) -> [SKIP][230] ([Intel XE#2341])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#307]) -> [SKIP][232] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][233] ([Intel XE#2341]) -> [FAIL][234] ([Intel XE#1178])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-6/igt@kms_content_protection@srm.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#308]) -> [SKIP][236] ([Intel XE#4208] / [i915#2575])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#4208] / [i915#2575]) -> [SKIP][238] ([Intel XE#308])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#455]) -> [SKIP][240] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#4208]) -> [SKIP][242] ([Intel XE#4356])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_dp_link_training@uhbr-mst.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#4356]) -> [SKIP][244] ([Intel XE#4208])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@kms_dp_link_training@uhbr-sst.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#455]) -> [SKIP][246] ([Intel XE#4208]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#4422]) -> [SKIP][248] ([Intel XE#4208])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#703]) -> [SKIP][250] ([Intel XE#4208] / [i915#2575])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#4208] / [i915#2575]) -> [SKIP][252] ([Intel XE#1138])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_feature_discovery@display-4x.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-433/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1137]) -> [SKIP][254] ([Intel XE#4208] / [i915#2575])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#4208]) -> [SKIP][256] ([Intel XE#455]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][258] ([Intel XE#455]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][259] ([Intel XE#2312]) -> [SKIP][260] ([Intel XE#2311]) +18 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][261] ([Intel XE#2312]) -> [SKIP][262] ([Intel XE#5390]) +7 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][263] ([Intel XE#5390]) -> [SKIP][264] ([Intel XE#2312]) +7 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#4208]) -> [SKIP][266] ([Intel XE#651]) +21 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][268] ([Intel XE#651]) +10 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][269] ([Intel XE#2311]) -> [SKIP][270] ([Intel XE#2312]) +15 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#651]) -> [SKIP][272] ([Intel XE#4208]) +22 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#651]) -> [SKIP][274] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#653]) -> [SKIP][276] ([Intel XE#4208]) +22 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][277] ([Intel XE#2312]) -> [SKIP][278] ([Intel XE#2313]) +11 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1158]) -> [SKIP][280] ([Intel XE#4208])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][281] ([Intel XE#2313]) -> [SKIP][282] ([Intel XE#2312]) +16 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#653]) -> [SKIP][284] ([Intel XE#2351] / [Intel XE#4208]) +13 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][286] ([Intel XE#653]) +7 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#4208]) -> [SKIP][288] ([Intel XE#653]) +22 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#4298]) -> [SKIP][290] ([Intel XE#4208])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@kms_joiner@basic-max-non-joiner.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#4208]) -> [SKIP][292] ([Intel XE#2925])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#4359]) -> [SKIP][294] ([Intel XE#4208])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#4208] / [i915#2575]) -> [FAIL][296] ([Intel XE#616])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_plane_cursor@primary.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][297] ([Intel XE#4596]) -> [SKIP][298] ([Intel XE#5021])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#5021]) -> [SKIP][300] ([Intel XE#4208] / [i915#2575])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-y.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#5020]) -> [SKIP][302] ([Intel XE#4208] / [i915#2575])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-435/igt@kms_plane_multiple@tiling-yf.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#4208]) -> [SKIP][304] ([Intel XE#870])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#1122]) -> [SKIP][306] ([Intel XE#2351] / [Intel XE#4208])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          [SKIP][307] ([Intel XE#736]) -> [SKIP][308] ([Intel XE#1909])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#4208]) -> [SKIP][310] ([Intel XE#1129])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#3309]) -> [SKIP][312] ([Intel XE#4208])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1129]) -> [SKIP][314] ([Intel XE#2351] / [Intel XE#4208])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#1489]) -> [SKIP][316] ([Intel XE#4208]) +10 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#4208]) -> [SKIP][318] ([Intel XE#1489]) +7 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1122]) -> [SKIP][320] ([Intel XE#4208]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][322] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#4208]) -> [SKIP][324] ([Intel XE#2850] / [Intel XE#929]) +16 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][326] ([Intel XE#4208]) +8 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][328] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-render.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#4208] / [i915#2575]) -> [SKIP][330] ([Intel XE#3414]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#3414]) -> [SKIP][332] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#4208] / [i915#2575]) -> [SKIP][334] ([Intel XE#1127])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][335] ([Intel XE#1729]) -> [SKIP][336] ([Intel XE#4208] / [i915#2575])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#4208] / [i915#2575]) -> [SKIP][338] ([Intel XE#1500])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#4208] / [i915#2575]) -> [SKIP][340] ([Intel XE#2168])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_vrr@cmrr.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#4208] / [i915#2575]) -> [SKIP][342] ([Intel XE#455]) +6 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@kms_vrr@flip-dpms.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@kms_vrr@flip-dpms.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][344] ([Intel XE#4208] / [i915#2575])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#4208]) -> [SKIP][346] ([Intel XE#1280] / [Intel XE#455])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][348] ([Intel XE#4208]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#4208]) -> [SKIP][350] ([Intel XE#1123])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1126]) -> [SKIP][352] ([Intel XE#4208])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#5419]) -> [SKIP][354] ([Intel XE#4208]) +2 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@xe_eu_stall@invalid-gt-id.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#4837]) -> [SKIP][356] ([Intel XE#4208]) +13 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-435/igt@xe_eudebug@basic-close.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#4208]) -> [INCOMPLETE][358] ([Intel XE#2594])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#4208]) -> [SKIP][360] ([Intel XE#4837]) +14 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_eudebug@vma-ufence-faultable.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#4208]) -> [SKIP][362] ([Intel XE#4518])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_eudebug_sriov@deny-eudebug.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#1392]) -> [SKIP][364] ([Intel XE#4208])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#4208]) -> [SKIP][366] ([Intel XE#1392])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#288]) -> [SKIP][368] ([Intel XE#4208]) +23 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#4208]) -> [SKIP][370] ([Intel XE#288]) +29 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#4208]) -> [SKIP][372] ([Intel XE#2360])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#4915]) -> [SKIP][374] ([Intel XE#4208]) +292 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-433/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#4208]) -> [SKIP][376] ([Intel XE#4915]) +270 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [INCOMPLETE][377] ([Intel XE#4911]) -> [SKIP][378] ([Intel XE#4208])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#4208]) -> [SKIP][380] ([Intel XE#560])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_media_fill@media-fill.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#4208]) -> [SKIP][382] ([Intel XE#4501])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_oa@buffer-size.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_oa@buffer-size.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][384] ([Intel XE#4208]) +7 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#5103]) -> [SKIP][386] ([Intel XE#4208])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-464/igt@xe_oa@mmio-triggered-reports-read.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#4208]) -> [SKIP][388] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][390] ([Intel XE#4208]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#4208]) -> [SKIP][392] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#1061] / [Intel XE#4208]) -> [SKIP][394] ([Intel XE#1061])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_peer2peer@write.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][396] ([Intel XE#4208]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2284]) -> [SKIP][398] ([Intel XE#4208])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#4208]) -> [SKIP][400] ([Intel XE#2284] / [Intel XE#366])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#4208]) -> [SKIP][402] ([Intel XE#4650])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_pmu@all-fn-engine-activity-load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#4650]) -> [SKIP][404] ([Intel XE#4208])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-435/igt@xe_pmu@fn-engine-activity-load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#4208]) -> [SKIP][406] ([Intel XE#4733]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_pxp@display-pxp-fb.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-466/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#4733]) -> [SKIP][408] ([Intel XE#4208]) +2 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-432/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#4208]) -> [SKIP][410] ([Intel XE#944]) +3 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-433/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#944]) -> [SKIP][412] ([Intel XE#4208]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#4814]) -> [SKIP][414] ([Intel XE#4208])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-432/igt@xe_render_copy@render-stress-0-copies.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#4208]) -> [SKIP][416] ([Intel XE#4814])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_render_copy@render-stress-1-copies.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#4821]) -> [SKIP][418] ([Intel XE#4208])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-433/igt@xe_spin_batch@spin-mem-copy.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#4208]) -> [SKIP][420] ([Intel XE#4130])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#4208]) -> [SKIP][422] ([Intel XE#3342])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419
  [Intel XE#5426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5426
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8447 -> IGTPW_13431

  IGTPW_13431: 13431
  IGT_8447: 8447
  xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99: 572882b22b077b1ef991abbe423d8c4bcb9d4a99

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/index.html

--===============7624624541189359541==
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
<tr><td><b>Series:</b></td><td>runner: Relax timeout reduction on soft lock=
up (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151190/">https://patchwork.freedesktop.org/series/151190/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13431/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13431/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8447_FULL -&gt; XEIGTPW_13431_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13431_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_13431_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13=
431_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-ma=
p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-=
execqueues-new-bo-map.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13431/shard-lnl-3/igt@xe_exec_system_allocator@t=
hreads-shared-vm-many-execqueues-new-bo-map.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-lnl-4/igt@xe_fault_injection@inject-fault-probe-function-x=
e_sriov_init.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13431/shard-lnl-5/igt@xe_fault_injection@inject-fault-pro=
be-function-xe_sriov_init.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function=
-xe_sriov_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_fault_injectio=
n@inject-fault-probe-function-xe_sriov_init.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13431_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@fbdev@eof.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@fbdev@e=
of.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entrie=
s-display-on.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13431/shard-dg2-436/igt@intel_sysfs_debugfs@xe-debugfs-re=
ad-all-entries-display-on.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear-atomic@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@kms_async_flips@asyn=
c-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#9=
11</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-5/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-6/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-=
2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_bw@linear-tiling-2-display=
s-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled=
-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +181 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3442">Intel XE#3442</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-=
y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel =
XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Int=
el XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tile=
d-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@kms_chamelium_frames@hdmi-cmp-=
planar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-wit=
h-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +23 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-after-=
hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-after-=
hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_content_protection@srm@pipe-=
a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-5/igt@kms_cursor_crc@cursor-random-128=
x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13431/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3431/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_cursor_legacy@short-busy-f=
lip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-1/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard=
-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
316">Intel XE#2316</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@kms_flip@2x-nonexisting-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13431/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-=
4tile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +203 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp=
-linear-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32b=
pp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp=
-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-=
1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip=
</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcps=
r-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5426">Intel XE#5426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-=
64.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13431/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-si=
ze-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-=
a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-3/igt@kms_plane_lowres@tiling-none@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-7/igt@k=
ms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/718">Intel XE#718</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">In=
tel XE#2505</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">In=
tel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-pl=
ane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1122">Intel XE#1122</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-6/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-3/igt@kms_psr@fbc-psr-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@kms_rotation_crc@primary-x-tiled=
-reflect-x-180.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-180.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1343=
1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) +87 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-f=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_vrr@flip-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_comput=
e:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_compute_preempt@compute-pre=
empt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_configfs@survivability-mode=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5249">Intel XE#5249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_eudebug@multigpu-basic-clie=
nt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@xe_eudebug@sysfs-toggle.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837=
">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-5/igt@xe_eudebug_online@single-step.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@xe_evict@evict-small-cm.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"=
>Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_exec_basic@multigpu-once-ba=
sic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-5/igt@xe_exec_basic@multigpu-once-basi=
c-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-435/igt@xe_exec_basic@multigpu-once-rebind.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/=
shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#139=
2</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic=
-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-=
batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/sha=
rd-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#387=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_exec_system_allocator@many-=
execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +72 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@xe_exec_system_allocator@once-la=
rge-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_exec_system_allocator@once-=
mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4915">Intel XE#4915</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-7/igt@xe_exec_system_allocator@process=
-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +10 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-no=
memset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-=
stride-new-bo-map-nomemset.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-5/igt@xe_exec_system_alloca=
tor@threads-shared-vm-many-stride-new-bo-map-nomemset.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#50=
18</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-432/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/i=
gt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-432/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13431/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">=
Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-464/igt@xe_module_load@reload.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436=
/igt@xe_module_load@reload.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_oa@oa-regs-whitelisted.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@xe_pm_residency@cpg-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-exec-post-=
termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@xe_query@multigpu-query-invali=
d-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_sriov_scheduling@equal-thro=
ughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4351">Intel XE#4351</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-lnl-2/igt@xe_sriov_scheduling@equal-throug=
hput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4351">Intel XE#4351</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-bmg-7/igt@xe_sriov_scheduling@equal-throug=
hput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@fbdev@read.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-=
432/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-4/igt@kms_async_flips=
@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a> +3 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/sha=
rd-dg2-463/igt@kms_async_flips@test-time-stamp.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonbl=
ocking-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms=
_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +1=
00 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pip=
e-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/sha=
rd-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_cursor_lega=
cy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +3 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633=
">Intel XE#4633</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13431/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_draw_crc@fill-fb.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13431/shard-dg2-435/igt@kms_draw_crc@fill-fb.html">PASS</a> +10 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13431/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreat=
e-interruptible.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13431/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-l=
nl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-5/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard=
-bmg-4/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe=
_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.h=
tml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">=
Intel XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13431/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-=
large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-lnl-4/i=
gt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-=
map-nomemset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-rebind.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_exec_threads@threads-hang=
-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_module_load@reload-no-display.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13431/shard-dg2-432/igt@xe_module_load@reload-no-display.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@invalid-extensions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_vm@invalid-extensions.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
431/shard-dg2-464/igt@xe_vm@invalid-extensions.html">PASS</a> +191 other te=
sts pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@kms_addfb_basic@add=
fb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-atomic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_async_flips@invali=
d-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">=
Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">In=
tel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13431/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Int=
el XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13431/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13431/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"=
>Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">I=
ntel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13431/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel=
 XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13431/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_big_fb@y-tiled-max=
-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-466/igt@kms_big_fb@y=
f-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#11=
24</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate=
-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_big_fb=
@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920=
x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_bw@connected-linear-t=
iling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920=
x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_bw@conn=
ected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13431/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_bw@linear-tiling-=
3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_ccs@ccs-on-another-=
bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-yf-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-r=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13431/shard-dg2-433/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_ccs@missing-=
ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard=
-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE=
#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13431/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Int=
el XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13431/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2907">Intel XE#2907</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_chamelium_color@ctm-gre=
en-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-433/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#30=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_134=
31/shard-dg2-436/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13431/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">I=
ntel XE#373</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#37=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_134=
31/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_content_protection@atomic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_content_protection@atomic.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">I=
ntel XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13431/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13431/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">In=
tel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">=
Intel XE#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13431/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#23=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
431/shard-bmg-4/igt@kms_content_protection@srm.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
8">Intel XE#308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13431/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_cursor_crc@curs=
or-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13431/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13431/shard-dg2-463/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE=
#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel =
XE#4356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13431/shard-dg2-436/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13431/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bp=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-vis=
ible-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc=
-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Inte=
l XE#703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13431/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13431/shard-dg2-433/igt@kms_feature_discovery@display-4=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel X=
E#1137</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13431/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp=
-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_flip_sc=
aled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-=
ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/i=
gt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-3/igt@kms_frontbuffer_tr=
acking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-2/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5390">Intel XE#5390</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-c=
ur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-463/igt@kms_frontbu=
ffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-s=
pr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms=
_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-sp=
r-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_frontbuffer_t=
racking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
+22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-4/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/115=
8">Intel XE#1158</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13431/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13431/shard-bmg-6/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +16 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_frontbuffer_=
tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13431/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Inte=
l XE#4298</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13431/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_joiner@switch-modeset-ultra-joiner-big-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@kms_joiner@switch-modeset-ul=
tra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/435=
9">Intel XE#4359</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13431/shard-dg2-436/igt@kms_pipe_stress@stress-xrgb8888-ytiled.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_plane_cursor@primary.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13431/shard-dg2-432/igt@kms_plane_cursor@primary.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel=
 XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13431/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5=
021</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel=
 XE#5021</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13431/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-435/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel X=
E#5020</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13431/shard-dg2-436/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13431/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">I=
ntel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel=
 XE#1122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13431/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel =
XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE=
#736</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13431/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909">Intel XE#190=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/sha=
rd-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel =
XE#3309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13431/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/sha=
rd-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg=
-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay=
-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#=
1122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13431/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#285=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"=
>Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13431/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13431/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850=
">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/929">Intel XE#929</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13431/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13431/shard-dg2-434/igt@kms_rotation_crc@primary-ro=
tation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3414">Intel XE#3414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13431/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-466/igt@kms_rotation_crc=
@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"=
>Intel XE#1729</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13431/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-435/igt@kms_tiled_di=
splay@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#=
2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13431/shard-dg2-464/igt@kms_vrr@cmrr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13431/shard-dg2-463/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091"=
>Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2849">Intel XE#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@sriov_basic@enable-vfs-auto=
probe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13431/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280=
">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
80">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_compute_preempt@compute=
-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13431/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">=
Intel XE#1126</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13431/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419">Intel XE#5=
419</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
3431/shard-dg2-436/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-435/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1343=
1/shard-dg2-436/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +13=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13431/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_eudebug@vma-ufence-faultable.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13431/shard-dg2-434/igt@xe_eudebug@vma-ufence-faultable.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Inte=
l XE#4837</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13431/shard-dg2-434/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE=
#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-bi=
ndexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-userptr-invalid=
ate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-432/igt@xe_exec_basic@multigpu-=
no-exec-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13431/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13431/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-r=
ebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/288">Intel XE#288</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13431/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-i=
nterrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-nomemset=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-433/igt@xe_exec_system_allocator@process-many-large-ex=
ecqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_exec_s=
ystem_allocator@process-many-large-execqueues-mmap-nomemset.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) +292 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-stride-m=
map-remap-eocheck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_exec_system=
_allocator@threads-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +270 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_=
send_recv.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4911">Intel XE#4911</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_fault_injecti=
on@probe-fail-guc-xe_guc_mmio_send_recv.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_media_fill@media-fill.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
431/shard-dg2-464/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_oa@buffer-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/sha=
rd-dg2-435/igt@xe_oa@buffer-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">=
Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped=
-access.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-464/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103">In=
tel XE#5103</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13431/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13431/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">=
Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#25=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/357=
3">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4501">Intel XE#4501</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_oa@syncs-syncobj-wait.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13431/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2=
541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
73">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4501">Intel XE#4501</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13431/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">=
Intel XE#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13431/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13431/sha=
rd-dg2-436/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13431/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel =
XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13431/shard-dg2-432/igt@xe_pmu@all-fn-engine-activity-load.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650=
">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-435/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel=
 XE#4650</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13431/shard-dg2-436/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1343=
1/shard-dg2-466/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-432/igt@xe_pxp@pxp-termination-key-update-post-rpm.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4733">Intel XE#4733</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13431/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-p=
ost-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13431/shard-dg2-433/igt@xe_query@multigpu-query-engines.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
944">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13431/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-=
guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-432/igt@xe_render_copy@render-stress-0-copies.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814=
">Intel XE#4814</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13431/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_render_copy@render-stress-1-copies.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13431/shard-dg2-463/igt@xe_render_copy@render-stress-1-copies.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-433/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821">Intel XE=
#4821</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13431/shard-dg2-436/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13431/shard-dg2-464/igt@xe_sriov_auto_provisioning@exclusi=
ve-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8447/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_13431/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Inte=
l XE#3342</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8447 -&gt; IGTPW_13431</li>
</ul>
<p>IGTPW_13431: 13431<br />
  IGT_8447: 8447<br />
  xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99: 572882b22b077b1ef991abb=
e423d8c4bcb9d4a99</p>

</body>
</html>

--===============7624624541189359541==--
