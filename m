Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3FBD0C604
	for <igt-dev@archiver.kernel.org>; Sat, 26 Oct 2024 18:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90DA10E173;
	Sat, 26 Oct 2024 18:29:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8A310E173;
 Sat, 26 Oct 2024 18:29:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4846282786552342676=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/xe=3A_Add_tests_to_vali?=
 =?utf-8?q?date_GT_coarse_power_gating_status_and_toggle_coarse_power_gating?=
 =?utf-8?q?_states?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sk.anirban@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 26 Oct 2024 18:29:28 -0000
Message-ID: <172996736842.1335517.4111817399780911940@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025055959.2152585-1-sk.anirban@intel.com>
In-Reply-To: <20241025055959.2152585-1-sk.anirban@intel.com>
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

--===============4846282786552342676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add tests to validate GT coarse power gating status and toggle coarse power gating states
URL   : https://patchwork.freedesktop.org/series/140473/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8083_full -> XEIGTPW_11980_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11980_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11980_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11980_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-8/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-6/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +4 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-5/igt@xe_exec_fault_mode@many-invalid-fault.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +5 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
    - shard-dg2-set2:     [PASS][7] -> [DMESG-WARN][8] +2 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-mixed-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_exec_threads@threads-mixed-userptr.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-433/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_pm_residency@cpg-basic (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@xe_pm_residency@cpg-basic.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][12] ([Intel XE#1600]) -> [DMESG-FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          [FAIL][14] ([Intel XE#2364]) -> [DMESG-FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_threads@threads-bal-mixed-userptr:
    - shard-bmg:          [SKIP][16] ([Intel XE#1130]) -> [DMESG-WARN][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-userptr.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@xe_exec_threads@threads-bal-mixed-userptr.html

  
New tests
---------

  New tests have been introduced between XEIGT_8083_full and XEIGTPW_11980_full:

### New IGT tests (5) ###

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_pm_residency@cpg-basic:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.00, 4.70] s

  * igt@xe_pm_residency@cpg-gt-toggle:
    - Statuses : 3 pass(s)
    - Exec time: [0.97, 1.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11980_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#873])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#316]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][20] ([Intel XE#877])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#607])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +7 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#367]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#787]) +83 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2887]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1195]) +1 other test incomplete
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#314]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1152]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#306])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#373]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#373]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2252]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_color@ctm-0-75:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#3007]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@kms_color@ctm-0-75.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_color@ctm-0-75.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#307])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#455]) +13 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#1178]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2320]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#308]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1424])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][48] ([Intel XE#301]) +3 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#301]) +6 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][51] -> [INCOMPLETE][52] ([Intel XE#1195] / [Intel XE#2049])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#886]) +8 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [PASS][55] -> [FAIL][56] ([Intel XE#301]) +3 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1397]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2293])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-4:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#1491]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-4.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-4.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2311])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#651]) +26 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#2890]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#651]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#656]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#653]) +25 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2313])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#1503])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#346])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2925])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#2934])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-bmg:          [PASS][75] -> [DMESG-WARN][76] ([Intel XE#877]) +3 other tests dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-5/igt@kms_lease@setcrtc-implicit-plane.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@kms_lease@setcrtc-implicit-plane.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][77] -> [FAIL][78] ([Intel XE#361])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#2763]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][81] ([Intel XE#2566] / [Intel XE#3177])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][82] ([Intel XE#3177]) +2 other tests dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#2763]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1122])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#718])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1129])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#908])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1489])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1489]) +8 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#2948]) +5 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_psr@psr2-basic.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1437])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#327]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#362])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#756])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1123])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#2905]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@discovery-empty:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2905]) +11 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_eudebug@discovery-empty.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][102] -> [INCOMPLETE][103] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [PASS][104] -> [INCOMPLETE][105] ([Intel XE#1473])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#688])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [PASS][107] -> [FAIL][108] ([Intel XE#1000])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1392]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#288]) +17 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_reset@virtual-cat-error:
    - shard-bmg:          [PASS][111] -> [SKIP][112] ([Intel XE#1130]) +10 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-3/igt@xe_exec_reset@virtual-cat-error.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@xe_exec_reset@virtual-cat-error.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1130])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_exec_reset@virtual-cat-error.html

  * igt@xe_exec_sip@invalidinstr-disabled:
    - shard-dg2-set2:     [PASS][114] -> [SKIP][115] ([Intel XE#1130]) +7 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@xe_exec_sip@invalidinstr-disabled.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_exec_sip@invalidinstr-disabled.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [PASS][116] -> [DMESG-WARN][117] ([Intel XE#358]) +1 other test dmesg-warn
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - shard-bmg:          [PASS][118] -> [DMESG-WARN][119] ([Intel XE#3230])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@xe_exec_threads@threads-mixed-fd-basic.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][120] ([Intel XE#3230])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_gt_freq@throttle_basic_api:
    - shard-bmg:          [PASS][121] -> [FAIL][122] ([Intel XE#3147])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-3/igt@xe_gt_freq@throttle_basic_api.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@xe_gt_freq@throttle_basic_api.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#2229]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2229])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#378])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@xe_module_load@load.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#2541]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2839] / [Intel XE#977])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2838] / [Intel XE#979])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#979])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#944]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [SKIP][132] ([Intel XE#1885]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1885]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@core_hotunplug@hotunbind-rebind.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_addfb_basic@unused-offsets:
    - shard-bmg:          [SKIP][136] ([Intel XE#3007]) -> [PASS][137] +11 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_addfb_basic@unused-offsets.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_addfb_basic@unused-offsets.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][138] ([Intel XE#911]) -> [PASS][139] +3 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][140] ([Intel XE#2231]) -> [PASS][141] +2 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          [FAIL][142] ([Intel XE#1659]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-bmg:          [SKIP][144] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][145] +3 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][146] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][148] ([Intel XE#1195] / [Intel XE#3113]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_color@ctm-0-50@pipe-a-edp-1:
    - shard-lnl:          [DMESG-WARN][150] ([Intel XE#2929]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-3/igt@kms_color@ctm-0-50@pipe-a-edp-1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-1/igt@kms_color@ctm-0-50@pipe-a-edp-1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][152] ([Intel XE#301]) -> [PASS][153] +2 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#2423] / [i915#2575]) -> [PASS][155] +12 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][156] ([Intel XE#301]) -> [PASS][157] +8 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][158] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][160] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][162] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [FAIL][164] ([Intel XE#886]) -> [PASS][165] +2 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [FAIL][166] ([Intel XE#2882]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#2890]) -> [PASS][169] +7 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_plane_cursor@viewport:
    - shard-lnl:          [FAIL][170] ([Intel XE#1471]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-7/igt@kms_plane_cursor@viewport.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-2/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][172] ([Intel XE#361]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][174] ([Intel XE#2029]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][176] ([Intel XE#2446]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#2446]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr@psr2-cursor-render@edp-1:
    - shard-lnl:          [FAIL][180] ([Intel XE#2948]) -> [PASS][181] +3 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-5/igt@kms_psr@psr2-cursor-render@edp-1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@kms_psr@psr2-cursor-render@edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][182] ([Intel XE#899]) -> [PASS][183] +2 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][184] ([Intel XE#1523]) -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-5/igt@kms_vblank@accuracy-idle.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [FAIL][186] ([Intel XE#2443]) -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-8/igt@kms_vrr@max-min.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-6/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][188] ([Intel XE#1473]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-lnl:          [DMESG-WARN][190] ([Intel XE#3230]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-3/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@close-execqueues-close-fd:
    - shard-dg2-set2:     [DMESG-WARN][192] ([Intel XE#358]) -> [PASS][193] +3 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-463/igt@xe_exec_reset@close-execqueues-close-fd.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_exec_reset@close-execqueues-close-fd.html

  * igt@xe_exec_reset@virtual-close-execqueues-close-fd:
    - shard-dg2-set2:     [FAIL][194] -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-436/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html
    - shard-bmg:          [FAIL][196] -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-2/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-2/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:
    - shard-dg2-set2:     [DMESG-WARN][198] -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][200] -> [PASS][201] +6 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-5/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
    - shard-lnl:          [DMESG-WARN][202] -> [PASS][203] +7 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-6/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - shard-dg2-set2:     [DMESG-WARN][204] ([Intel XE#3230]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@xe_exec_threads@threads-mixed-basic.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_gt_freq@freq_basic_api:
    - shard-lnl:          [FAIL][206] -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-3/igt@xe_gt_freq@freq_basic_api.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@xe_gt_freq@freq_basic_api.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-WARN][208] ([Intel XE#3184]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1192]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html
    - shard-lnl:          [SKIP][212] ([Intel XE#1192]) -> [PASS][213] +2 other tests pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [FAIL][214] ([Intel XE#2136]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-7/igt@xe_module_load@many-reload.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@xe_module_load@many-reload.html
    - shard-dg2-set2:     [FAIL][216] ([Intel XE#2136]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@xe_module_load@many-reload.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][218] ([Intel XE#1794]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1130]) -> [PASS][221] +17 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_vm@large-split-binds-536870912.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_vm@large-split-binds-536870912.html

  * igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:
    - shard-bmg:          [SKIP][222] ([Intel XE#1130]) -> [PASS][223] +25 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html

  
#### Warnings ####

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][224] ([Intel XE#3007]) -> [SKIP][225] ([Intel XE#2385])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][226] ([Intel XE#367]) -> [SKIP][227] ([Intel XE#3007])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#367]) -> [SKIP][229] ([Intel XE#2423] / [i915#2575])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#2423] / [i915#2575]) -> [SKIP][231] ([Intel XE#367]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
    - shard-bmg:          [SKIP][232] ([Intel XE#3007]) -> [SKIP][233] ([Intel XE#367])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][234] ([Intel XE#2887]) -> [SKIP][235] ([Intel XE#2231])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][237] ([Intel XE#2890])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][238] ([Intel XE#2231]) -> [SKIP][239] ([Intel XE#2887])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#2890]) -> [SKIP][241] ([Intel XE#455] / [Intel XE#787])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2423] / [i915#2575]) -> [SKIP][243] ([Intel XE#306])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_chamelium_color@gamma.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_chamelium_color@gamma.html
    - shard-bmg:          [SKIP][244] ([Intel XE#3007]) -> [SKIP][245] ([Intel XE#2325])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_chamelium_color@gamma.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@kms_chamelium_color@gamma.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][246] ([Intel XE#3007]) -> [SKIP][247] ([Intel XE#2320]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [FAIL][248] ([Intel XE#2141]) -> [SKIP][249] ([Intel XE#2231])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][250] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][251] ([Intel XE#2244])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_dsc@dsc-basic.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_dsc@dsc-basic.html
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2351]) -> [SKIP][253] ([Intel XE#455])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_dsc@dsc-basic.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][254] ([Intel XE#1504]) -> [TIMEOUT][255] ([Intel XE#1504]) +1 other test timeout
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-1/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:
    - shard-lnl:          [FAIL][256] ([Intel XE#886]) -> [FAIL][257] ([Intel XE#3036])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][258] ([Intel XE#2231]) -> [SKIP][259] ([Intel XE#2293] / [Intel XE#2380])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#2890]) -> [SKIP][261] ([Intel XE#455])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][262] ([Intel XE#2231]) -> [SKIP][263] ([Intel XE#2311]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][265] ([Intel XE#651]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2890]) -> [SKIP][267] ([Intel XE#651]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
    - shard-bmg:          [SKIP][268] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][269] ([Intel XE#2311])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][270] ([Intel XE#2311]) -> [SKIP][271] ([Intel XE#2231])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#651]) -> [SKIP][273] ([Intel XE#2351] / [Intel XE#2890])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][274] ([Intel XE#2231] / [Intel XE#2890]) -> [FAIL][275] ([Intel XE#2333]) +1 other test fail
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [FAIL][276] ([Intel XE#2333]) -> [SKIP][277] ([Intel XE#2231])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#651]) -> [SKIP][279] ([Intel XE#2890])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
    - shard-bmg:          [SKIP][280] ([Intel XE#2311]) -> [SKIP][281] ([Intel XE#2231] / [Intel XE#2890])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][282] ([Intel XE#2313]) -> [SKIP][283] ([Intel XE#2231] / [Intel XE#2890]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][284] ([Intel XE#2231]) -> [SKIP][285] ([Intel XE#2313]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][287] ([Intel XE#653]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2890]) -> [SKIP][289] ([Intel XE#653]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][290] ([Intel XE#2313]) -> [SKIP][291] ([Intel XE#2231]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#653]) -> [SKIP][293] ([Intel XE#2890]) +3 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][294] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][295] ([Intel XE#2313]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][296] ([Intel XE#3007]) -> [SKIP][297] ([Intel XE#2502])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2423] / [i915#2575]) -> [SKIP][299] ([Intel XE#605])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [SKIP][300] ([Intel XE#3007]) -> [DMESG-WARN][301] ([Intel XE#2566] / [Intel XE#3177])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][302] ([Intel XE#2231]) -> [SKIP][303] ([Intel XE#1489])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2890]) -> [SKIP][305] ([Intel XE#1489])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][306] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][307] ([Intel XE#2387])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#2890]) -> [SKIP][309] ([Intel XE#1122])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-bmg:          [SKIP][310] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][311] ([Intel XE#2234] / [Intel XE#2850])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_psr@fbc-pr-primary-blt.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-6/igt@kms_psr@fbc-pr-primary-blt.html
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][313] ([Intel XE#2850] / [Intel XE#929])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_psr@fbc-pr-primary-blt.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-bmg:          [SKIP][314] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][315] ([Intel XE#2231] / [Intel XE#2890])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-5/igt@kms_psr@psr2-cursor-blt.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_psr@psr2-cursor-blt.html
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][317] ([Intel XE#2890])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-434/igt@kms_psr@psr2-cursor-blt.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          [DMESG-FAIL][318] ([Intel XE#2055]) -> [FAIL][319] ([Intel XE#3209])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#2423] / [i915#2575]) -> [SKIP][321] ([Intel XE#455]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full.html
    - shard-bmg:          [SKIP][322] ([Intel XE#3007]) -> [SKIP][323] ([Intel XE#2413])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][324] ([Intel XE#2426]) -> [FAIL][325] ([Intel XE#1729])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][326] ([Intel XE#2509]) -> [SKIP][327] ([Intel XE#2426])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][328] ([Intel XE#3007]) -> [SKIP][329] ([Intel XE#2168])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_vrr@lobf.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#2423] / [i915#2575]) -> [SKIP][331] ([Intel XE#2168])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_vrr@lobf.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-433/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          [SKIP][332] ([Intel XE#3007]) -> [SKIP][333] ([Intel XE#756])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2423] / [i915#2575]) -> [SKIP][335] ([Intel XE#756])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][336] ([Intel XE#1130]) -> [SKIP][337] ([Intel XE#2905]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#1130]) -> [SKIP][339] ([Intel XE#2905]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_eudebug_online@stopped-thread.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-bmg:          [SKIP][340] ([Intel XE#2905]) -> [SKIP][341] ([Intel XE#1130])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#2905]) -> [SKIP][343] ([Intel XE#1130])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-463/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#1130]) -> [SKIP][345] ([Intel XE#288]) +3 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#288]) -> [SKIP][347] ([Intel XE#1130]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html

  * igt@xe_oa@polling:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#1130]) -> [SKIP][349] ([Intel XE#2541])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_oa@polling.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_oa@polling.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#1130]) -> [SKIP][351] ([Intel XE#579])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          [SKIP][352] ([Intel XE#1130]) -> [SKIP][353] ([Intel XE#579])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][354] ([Intel XE#944]) -> [SKIP][355] ([Intel XE#1130])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#944]) -> [SKIP][357] ([Intel XE#1130])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3036]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3147]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3147
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3209]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3209
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8083 -> IGTPW_11980
  * Linux: xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4 -> xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107

  IGTPW_11980: 2656d361bad30d96c1c422f4af92bcedd7558f63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4: 75eab7b9ee32a121d95a42ac704b679097f1fac4
  xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107: 8fb857e3bba9a5e5fa43d99cf5863608cde9c107

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/index.html

--===============4846282786552342676==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add tests to validate GT coarse power gating status and toggle coarse power gating states</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140473/">https://patchwork.freedesktop.org/series/140473/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8083_full -&gt; XEIGTPW_11980_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11980_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11980_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11980_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-8/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-6/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-5/igt@xe_exec_fault_mode@many-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@xe_exec_fault_mode@many-invalid-fault.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_exec_threads@threads-mixed-userptr.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-433/igt@xe_live_ktest@xe_eudebug.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@xe_pm_residency@cpg-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@xe_exec_threads@threads-bal-mixed-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@xe_exec_threads@threads-bal-mixed-userptr.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8083_full and XEIGTPW_11980_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 4.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-gt-toggle:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.97, 1.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11980_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@kms_color@ctm-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-5/igt@kms_lease@setcrtc-implicit-plane.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@kms_lease@setcrtc-implicit-plane.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-cat-error:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-3/igt@xe_exec_reset@virtual-cat-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@xe_exec_reset@virtual-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_exec_reset@virtual-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-disabled:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@xe_exec_sip@invalidinstr-disabled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_exec_sip@invalidinstr-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@throttle_basic_api:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-3/igt@xe_gt_freq@throttle_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@xe_gt_freq@throttle_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3147">Intel XE#3147</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@core_hotunplug@hotunbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_addfb_basic@unused-offsets.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-3/igt@kms_color@ctm-0-50@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-1/igt@kms_color@ctm-0-50@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@kms_flip@absolute-wf_vblank.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-7/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-2/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-5/igt@kms_psr@psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@kms_psr@psr2-cursor-render@edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-5/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-8/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-6/igt@kms_vrr@max-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-3/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-execqueues-close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-463/igt@xe_exec_reset@close-execqueues-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_exec_reset@close-execqueues-close-fd.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-execqueues-close-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-436/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-2/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-2/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-5/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-6/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_basic_api:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-3/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-8/igt@xe_gt_freq@freq_basic_api.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-3/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-7/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@xe_module_load@many-reload.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_vm@large-split-binds-536870912.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html">PASS</a> +25 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-1/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036">Intel XE#3036</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-6/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-5/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-434/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3209">Intel XE#3209</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-433/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-434/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-463/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_oa@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-464/igt@xe_oa@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/shard-dg2-464/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11980/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8083 -&gt; IGTPW_11980</li>
<li>Linux: xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4 -&gt; xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107</li>
</ul>
<p>IGTPW_11980: 2656d361bad30d96c1c422f4af92bcedd7558f63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4: 75eab7b9ee32a121d95a42ac704b679097f1fac4<br />
  xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107: 8fb857e3bba9a5e5fa43d99cf5863608cde9c107</p>

</body>
</html>

--===============4846282786552342676==--
