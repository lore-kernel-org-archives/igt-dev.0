Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9EAC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 21:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D8610E92C;
	Thu,  1 Aug 2024 21:05:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0761910E0D8;
 Thu,  1 Aug 2024 21:05:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3854433341578394136=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/xe=5Fsysfs=5Fpree?=
 =?utf-8?q?mpt=5Ftimeout=3A_Porting_sysfs_preempt_test_in_xe_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Aug 2024 21:05:45 -0000
Message-ID: <172254634501.489233.10198630303670672153@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801150737.3700254-1-nakshtra.goyal@intel.com>
In-Reply-To: <20240801150737.3700254-1-nakshtra.goyal@intel.com>
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

--===============3854433341578394136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev5)
URL   : https://patchwork.freedesktop.org/series/136449/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7951_full -> XEIGTPW_11518_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11518_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11518_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11518_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-lnl:          [PASS][5] -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@kms_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-5/igt@kms_vrr@flip-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_vrr@flip-basic.html

  
#### Warnings ####

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          [SKIP][9] ([Intel XE#1439]) -> [SKIP][10] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@alternate-sync-async-flip:
    - {shard-bmg}:        NOTRUN -> [DMESG-WARN][11] +5 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - {shard-bmg}:        [SKIP][12] ([Intel XE#1124]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - {shard-bmg}:        [SKIP][14] ([Intel XE#367]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - {shard-bmg}:        [SKIP][16] ([Intel XE#2251]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - {shard-bmg}:        [FAIL][18] ([Intel XE#2436]) -> [DMESG-FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - {shard-bmg}:        [SKIP][20] ([Intel XE#2325]) -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - {shard-bmg}:        [SKIP][22] ([Intel XE#2252]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic:
    - {shard-bmg}:        NOTRUN -> [FAIL][24] +4 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - {shard-bmg}:        [FAIL][25] -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-1/igt@kms_content_protection@legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - {shard-bmg}:        [SKIP][27] -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@kms_content_protection@uevent.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - {shard-bmg}:        [SKIP][29] ([Intel XE#2320]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - {shard-bmg}:        [PASS][31] -> [INCOMPLETE][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - {shard-bmg}:        [SKIP][33] ([Intel XE#2311]) -> [SKIP][34] +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - {shard-bmg}:        [SKIP][35] ([Intel XE#2313]) -> [SKIP][36] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-source-clamping:
    - {shard-bmg}:        [DMESG-WARN][37] -> [INCOMPLETE][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - {shard-bmg}:        [PASS][39] -> [WARN][40] +1 other test warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3:
    - {shard-bmg}:        [PASS][41] -> [FAIL][42] +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-6/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-8/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
    - {shard-bmg}:        [SKIP][43] ([Intel XE#1489]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - {shard-bmg}:        [SKIP][45] ([Intel XE#2234]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-render.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        [SKIP][47] -> [TIMEOUT][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - {shard-bmg}:        [SKIP][49] ([Intel XE#2322]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_queue_property@basic-get-property:
    - {shard-bmg}:        NOTRUN -> [SKIP][51] +15 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@xe_exec_queue_property@basic-get-property.html

  * igt@xe_module_load@many-reload:
    - {shard-bmg}:        [FAIL][52] -> [TIMEOUT][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-7/igt@xe_module_load@many-reload.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@xe_module_load@many-reload.html

  * igt@xe_prime_self_import@basic-llseek-size:
    - {shard-bmg}:        [PASS][54] -> [DMESG-WARN][55] +5 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-2/igt@xe_prime_self_import@basic-llseek-size.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-1/igt@xe_prime_self_import@basic-llseek-size.html

  * igt@xe_vm@bind-no-array-conflict:
    - {shard-bmg}:        [PASS][56] -> [SKIP][57] +33 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@xe_vm@bind-no-array-conflict.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@xe_vm@bind-no-array-conflict.html

  
New tests
---------

  New tests have been introduced between XEIGT_7951_full and XEIGTPW_11518_full:

### New IGT tests (6) ###

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 12.94] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@bcs:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@ccs:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vcs:
    - Statuses : 1 pass(s)
    - Exec time: [2.53] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs:
    - Statuses : 1 pass(s)
    - Exec time: [1.89] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11518_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][58] -> [SKIP][59] ([Intel XE#1201] / [Intel XE#1885])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@core_hotunplug@hotreplug.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@core_hotunplug@hotreplug.html
    - shard-lnl:          [PASS][60] -> [SKIP][61] ([Intel XE#1885])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@core_hotunplug@hotreplug.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@core_hotunplug@hotreplug.html

  * igt@intel_hwmon@hwmon-write:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1125])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - shard-dg2-set2:     [PASS][63] -> [SKIP][64] ([Intel XE#1201] / [i915#2575]) +11 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
    - shard-lnl:          [PASS][65] -> [SKIP][66] ([Intel XE#2423]) +18 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-5/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#664])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1407]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][69] -> [SKIP][70] ([Intel XE#2351]) +19 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#316])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1124])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1124])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#610])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1428])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_joiner@basic-force-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2351]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_big_joiner@basic-force-joiner.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#367])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1512])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1399]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#1201]) +16 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#787]) +83 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#787]) +41 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#306])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#306]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#306])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#373]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#373])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][96] ([Intel XE#1178]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#599]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1201] / [i915#2575]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1424])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#309])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-dg2-set2:     [PASS][102] -> [SKIP][103] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1138] / [Intel XE#1201])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1421])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][106] -> [INCOMPLETE][107] ([Intel XE#1195] / [Intel XE#2049]) +1 other test incomplete
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][108] -> [INCOMPLETE][109] ([Intel XE#1195]) +1 other test incomplete
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#455]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1397]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     [PASS][113] -> [SKIP][114] ([Intel XE#1201] / [Intel XE#2351]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1401] / [Intel XE#1745])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1401]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#651])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#2351]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#651]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#651]) +13 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1201]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#1201] / [Intel XE#658])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1469])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1158] / [Intel XE#1201])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#656]) +13 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#653]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][128] -> [DMESG-WARN][129] ([Intel XE#2019])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][130] -> [DMESG-FAIL][131] ([Intel XE#324]) +2 other tests dmesg-fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_plane@plane-position-covered.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-2:
    - shard-lnl:          [PASS][132] -> [DMESG-WARN][133] ([Intel XE#324])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][134] ([Intel XE#616]) +3 other tests fail
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2318]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#2318]) +10 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#929]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-cursor-render:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1406])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-suspend@edp-1:
    - shard-lnl:          [PASS][146] -> [FAIL][147] ([Intel XE#2028]) +3 other tests fail
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_psr@psr2-suspend@edp-1.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@kms_psr@psr2-suspend@edp-1.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#1127] / [Intel XE#1201])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#327])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#1437]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][153] -> [FAIL][154] ([Intel XE#899])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#2423]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_vblank@query-forked.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][156] ([Intel XE#2019]) +2 other tests dmesg-warn
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#1201] / [Intel XE#756])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#756])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#1123] / [Intel XE#1201])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][161] ([Intel XE#1600])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][162] -> [TIMEOUT][163] ([Intel XE#1473])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#688]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][165] -> [TIMEOUT][166] ([Intel XE#1473] / [Intel XE#392])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@xe_evict@evict-threads-large.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [PASS][167] -> [SKIP][168] ([Intel XE#1130] / [Intel XE#1201]) +45 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#1130]) +9 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#1392])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@once-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#288]) +4 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#1201] / [Intel XE#2360])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#2229])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][175] ([Intel XE#1999]) +1 other test fail
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#1416])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@xe_mmap@vram.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][177] -> [DMESG-WARN][178] ([Intel XE#1551] / [Intel XE#2019])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@xe_module_load@unload.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_module_load@unload.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#379])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#1201] / [Intel XE#2419]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#2419])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][182] ([Intel XE#1173])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#2284] / [Intel XE#366])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@xe_pm@d3cold-basic.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][185] ([Intel XE#1551] / [Intel XE#569]) +1 other test dmesg-warn
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][186] -> [ABORT][187] ([Intel XE#1794])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@xe_pm@s4-mocs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#1130] / [Intel XE#1201]) +21 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_pm_residency@idle-residency-on-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][189] -> [FAIL][190] ([Intel XE#958])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#944])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#1201] / [Intel XE#944])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_vm@large-userptr-misaligned-binds-16777216:
    - shard-lnl:          [PASS][193] -> [SKIP][194] ([Intel XE#1130]) +63 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@xe_vm@large-userptr-misaligned-binds-16777216.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_vm@large-userptr-misaligned-binds-16777216.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#1885]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][197] ([Intel XE#911]) -> [PASS][198] +3 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic@atomic-invalid-params:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [i915#2575]) -> [PASS][200] +14 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_atomic@atomic-invalid-params.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [FAIL][201] ([Intel XE#1659]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201]) -> [PASS][204] +11 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3:
    - {shard-bmg}:        [FAIL][205] ([Intel XE#2436]) -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [PASS][208] +15 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - {shard-bmg}:        [SKIP][209] ([Intel XE#2291]) -> [PASS][210] +2 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - {shard-bmg}:        [SKIP][211] ([Intel XE#2316]) -> [PASS][212] +3 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - {shard-bmg}:        [INCOMPLETE][213] -> [PASS][214] +5 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [FAIL][215] ([Intel XE#886]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_lease@lease-unleased-crtc:
    - shard-lnl:          [SKIP][217] ([Intel XE#2423]) -> [PASS][218] +27 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_lease@lease-unleased-crtc.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_lease@lease-unleased-crtc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][219] ([Intel XE#1162]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-lnl:          [SKIP][221] ([Intel XE#2351]) -> [PASS][222] +19 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_pm_backlight@basic-brightness.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][223] ([Intel XE#718]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          [SKIP][225] -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_pm_rpm@drm-resources-equal.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - {shard-bmg}:        [FAIL][227] -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-lnl:          [SKIP][229] ([Intel XE#1130]) -> [PASS][230] +60 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@xe_ccs@block-multicopy-inplace.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - {shard-bmg}:        [FAIL][231] ([Intel XE#2364]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - {shard-bmg}:        [DMESG-WARN][233] -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-5/igt@xe_exec_balancer@many-cm-parallel-basic.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-5/igt@xe_exec_balancer@many-cm-parallel-basic.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - {shard-bmg}:        [SKIP][235] -> [PASS][236] +83 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-7/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][238] +57 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_exec_basic@no-exec-basic-defer-bind.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate-race:
    - shard-lnl:          [FAIL][239] ([Intel XE#1069]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-2/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr:
    - shard-dg2-set2:     [INCOMPLETE][241] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html

  * igt@xe_live_ktest@xe_bo:
    - shard-lnl:          [SKIP][243] ([Intel XE#1192]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-5/igt@xe_live_ktest@xe_bo.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-lnl:          [FAIL][245] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][247] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - {shard-bmg}:        [SKIP][249] ([Intel XE#1130]) -> [PASS][250] +13 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@xe_pm@s4-vm-bind-unbind-all.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          [SKIP][251] ([Intel XE#1125]) -> [SKIP][252] ([Intel XE#2351])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@intel_hwmon@hwmon-read.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@invalid-get-prop-any:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][254] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_addfb_basic@invalid-get-prop-any.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_addfb_basic@invalid-get-prop-any.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#801]) -> [SKIP][256] ([Intel XE#801]) +23 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][258] ([Intel XE#316]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][259] -> [SKIP][260] ([Intel XE#1201])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - shard-lnl:          [DMESG-WARN][261] ([Intel XE#1725]) -> [SKIP][262] ([Intel XE#2351])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#316]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][266] ([Intel XE#1201] / [Intel XE#2351])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
    - shard-lnl:          [SKIP][267] ([Intel XE#1407]) -> [SKIP][268] ([Intel XE#2351])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#607]) -> [SKIP][270] ([Intel XE#1201] / [Intel XE#2351])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1201]) -> [SKIP][272] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][274] ([Intel XE#1124] / [Intel XE#1201])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1124]) -> [SKIP][276] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          [SKIP][277] ([Intel XE#2351]) -> [SKIP][278] ([Intel XE#1124]) +4 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][280] ([Intel XE#1201]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
    - shard-lnl:          [SKIP][281] ([Intel XE#1124]) -> [SKIP][282] ([Intel XE#2351]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201]) -> [SKIP][284] ([Intel XE#1201] / [Intel XE#619])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-lnl:          [SKIP][285] ([Intel XE#2351]) -> [SKIP][286] ([Intel XE#1467])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][288] ([Intel XE#1201])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          [SKIP][289] ([Intel XE#1477]) -> [SKIP][290] ([Intel XE#2351]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1124]) -> [SKIP][292] ([Intel XE#1201])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][294] ([Intel XE#1124]) +7 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][296] ([Intel XE#367])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][298] ([Intel XE#367])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201] / [i915#2575]) -> [SKIP][300] ([Intel XE#1201] / [Intel XE#367])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
    - shard-lnl:          [SKIP][301] ([Intel XE#2423]) -> [SKIP][302] ([Intel XE#367])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][304] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          [SKIP][305] ([Intel XE#367]) -> [SKIP][306] ([Intel XE#2423])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][308] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          [SKIP][309] ([Intel XE#2351]) -> [SKIP][310] ([Intel XE#1399]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1201]) -> [SKIP][312] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#787]) -> [SKIP][314] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][316] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][318] ([Intel XE#787]) +34 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][320] ([Intel XE#1201])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
    - shard-lnl:          [SKIP][321] ([Intel XE#1399]) -> [SKIP][322] ([Intel XE#2351]) +4 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][324] ([Intel XE#1201])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1201]) -> [SKIP][326] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][328] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][330] ([Intel XE#306])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
    - shard-lnl:          [SKIP][331] ([Intel XE#2423]) -> [SKIP][332] ([Intel XE#306])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_chamelium_color@ctm-0-75.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][334] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          [SKIP][335] ([Intel XE#306]) -> [SKIP][336] ([Intel XE#2423]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_chamelium_color@ctm-max.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_chamelium_color@ctm-max.html
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][338] ([Intel XE#1201] / [i915#2575])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_chamelium_color@ctm-max.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#306]) -> [SKIP][340] ([Intel XE#1201] / [Intel XE#306])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_chamelium_color@gamma.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#373]) -> [SKIP][342] ([Intel XE#1201] / [i915#2575])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-read.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][344] ([Intel XE#373]) +6 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][346] ([Intel XE#1201] / [Intel XE#373])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][348] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-single.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-single.html
    - shard-lnl:          [SKIP][349] ([Intel XE#373]) -> [SKIP][350] ([Intel XE#2423]) +4 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc-single.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][352] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#373]) -> [SKIP][354] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1201] / [i915#2575]) -> [SKIP][356] ([Intel XE#1201] / [Intel XE#373])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-lnl:          [SKIP][357] ([Intel XE#2423]) -> [SKIP][358] ([Intel XE#373]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1201] / [i915#2575]) -> [SKIP][360] ([Intel XE#455])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_content_protection@content-type-change.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_content_protection@content-type-change.html
    - shard-lnl:          [SKIP][361] ([Intel XE#2423]) -> [SKIP][362] ([Intel XE#599]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_content_protection@content-type-change.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][364] ([Intel XE#307])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][366] ([Intel XE#1201] / [Intel XE#455])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][368] ([Intel XE#308])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#1201] / [i915#2575]) -> [SKIP][370] ([Intel XE#1201] / [Intel XE#455])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x32.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][372] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_cursor_crc@cursor-random-max-size.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html
    - shard-lnl:          [SKIP][373] ([Intel XE#1424]) -> [SKIP][374] ([Intel XE#2423]) +2 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_cursor_crc@cursor-random-max-size.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          [SKIP][375] ([Intel XE#2423]) -> [SKIP][376] ([Intel XE#1424]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][378] ([Intel XE#1201] / [i915#2575])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#455]) -> [SKIP][380] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          [SKIP][381] ([Intel XE#309]) -> [SKIP][382] ([Intel XE#2423])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][384] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-lnl:          [SKIP][385] ([Intel XE#2423]) -> [SKIP][386] ([Intel XE#323]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-lnl:          [SKIP][387] ([Intel XE#2423]) -> [SKIP][388] ([Intel XE#309])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][390] ([Intel XE#323])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][392] ([Intel XE#1201])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-lnl:          [SKIP][393] ([Intel XE#599]) -> [SKIP][394] ([Intel XE#2351])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#1201]) -> [SKIP][396] ([Intel XE#776])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-lnl:          [SKIP][397] ([Intel XE#1421]) -> [SKIP][398] ([Intel XE#2423]) +2 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          [SKIP][399] ([Intel XE#2423]) -> [SKIP][400] ([Intel XE#1421]) +2 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend.html
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][402] ([Intel XE#2019])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][403] ([Intel XE#2019]) -> [INCOMPLETE][404] ([Intel XE#1195] / [Intel XE#2019])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][405] ([Intel XE#1551]) -> [INCOMPLETE][406] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][408] ([Intel XE#455])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1201]) -> [SKIP][410] ([Intel XE#1201] / [Intel XE#455])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][411] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][412] ([Intel XE#2351]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][414] ([Intel XE#455]) +8 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][416] ([Intel XE#1201] / [Intel XE#455])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-lnl:          [SKIP][417] ([Intel XE#2351]) -> [SKIP][418] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          [SKIP][419] ([Intel XE#2423]) -> [SKIP][420] ([Intel XE#352])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#1201] / [i915#2575]) -> [SKIP][422] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_force_connector_basic@force-edid.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1201]) -> [SKIP][424] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
    - shard-lnl:          [SKIP][425] ([Intel XE#2351]) -> [SKIP][426] ([Intel XE#651]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][428] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][430] ([Intel XE#651]) +20 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#651]) -> [SKIP][432] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][433] ([Intel XE#2351]) -> [SKIP][434] ([Intel XE#656]) +13 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][436] ([Intel XE#1201]) +6 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
    - shard-lnl:          [SKIP][437] ([Intel XE#651]) -> [SKIP][438] ([Intel XE#2351]) +4 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#1201]) -> [SKIP][440] ([Intel XE#653]) +2 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][442] ([Intel XE#1201] / [Intel XE#2351]) +3 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][444] ([Intel XE#1201]) +4 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
    - shard-lnl:          [SKIP][445] ([Intel XE#656]) -> [SKIP][446] ([Intel XE#2351]) +17 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#653]) -> [SKIP][448] ([Intel XE#1201])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][450] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1201]) -> [SKIP][452] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][454] ([Intel XE#653]) +20 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#653]) -> [SKIP][456] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     [DMESG-FAIL][457] ([Intel XE#1551]) -> [SKIP][458] ([Intel XE#1201] / [i915#2575])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [FAIL][459] ([Intel XE#361]) -> [SKIP][460] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-lnl:          [SKIP][461] ([Intel XE#599]) -> [SKIP][462] ([Intel XE#2423]) +2 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][464] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][466] ([Intel XE#498]) +2 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-lnl:          [SKIP][467] ([Intel XE#2423]) -> [SKIP][468] ([Intel XE#2318])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#1201]) -> [SKIP][470] ([Intel XE#1201] / [Intel XE#870])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][472] ([Intel XE#870])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_pm_backlight@fade.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#870]) -> [SKIP][474] ([Intel XE#1201] / [Intel XE#870])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1129]) -> [SKIP][476] ([Intel XE#1129] / [Intel XE#1201])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][478] ([Intel XE#908])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][480] ([Intel XE#1489])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][482] ([Intel XE#1201])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#1201]) -> [SKIP][484] ([Intel XE#1489])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1122]) -> [SKIP][486] ([Intel XE#1122] / [Intel XE#1201])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#1201]) -> [SKIP][488] ([Intel XE#929]) +1 other test skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
    - shard-lnl:          [SKIP][489] ([Intel XE#2351]) -> [SKIP][490] ([Intel XE#1406]) +2 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_psr@fbc-pr-dpms.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][492] ([Intel XE#1201] / [Intel XE#2351])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][494] ([Intel XE#1201]) +1 other test skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_psr@fbc-psr-primary-blt.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][496] ([Intel XE#1201] / [Intel XE#929])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#929]) -> [SKIP][498] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#929]) -> [SKIP][500] ([Intel XE#1201]) +2 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-render.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          [SKIP][501] ([Intel XE#1406]) -> [SKIP][502] ([Intel XE#2351]) +2 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_psr@pr-primary-blt.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@pr-suspend:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#1201]) -> [SKIP][504] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_psr@pr-suspend.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][506] ([Intel XE#929]) +7 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_psr@psr-dpms.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#1201]) -> [SKIP][508] ([Intel XE#1149] / [Intel XE#1201])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#1201] / [i915#2575]) -> [SKIP][510] ([Intel XE#1201] / [Intel XE#327])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][512] ([Intel XE#1127])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][514] ([Intel XE#327])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#327]) -> [SKIP][516] ([Intel XE#1201] / [Intel XE#327])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#1201] / [i915#2575]) -> [SKIP][518] ([Intel XE#1201] / [Intel XE#1500])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-lnl:          [SKIP][519] ([Intel XE#2423]) -> [SKIP][520] ([Intel XE#362])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][522] ([Intel XE#1201] / [Intel XE#2168])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_vrr@cmrr.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_vrr@cmrr.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][524] ([Intel XE#1091]) +1 other test skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          [SKIP][525] ([Intel XE#1447]) -> [SKIP][526] ([Intel XE#1130])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@xe_compute@ccs-mode-basic.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][528] ([Intel XE#1130] / [Intel XE#1201])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][530] ([Intel XE#1123] / [Intel XE#1201])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][532] ([Intel XE#1126]) +1 other test skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][534] ([Intel XE#1130] / [Intel XE#1201])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][535] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][536] ([Intel XE#1473] / [Intel XE#392])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][537] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][538] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          [SKIP][539] ([Intel XE#688]) -> [SKIP][540] ([Intel XE#1130]) +3 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          [SKIP][541] ([Intel XE#1130]) -> [SKIP][542] ([Intel XE#688]) +5 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-lnl:          [SKIP][543] ([Intel XE#1392]) -> [SKIP][544] ([Intel XE#1130]) +2 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-lnl:          [SKIP][545] ([Intel XE#1130]) -> [SKIP][546] ([Intel XE#1392]) +3 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][548] ([Intel XE#288]) +14 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][550] ([Intel XE#288]) +2 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][552] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][554] ([Intel XE#1130] / [Intel XE#1201]) +9 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#288]) -> [SKIP][556] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#288]) -> [SKIP][558] ([Intel XE#1130] / [Intel XE#1201])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][560] ([Intel XE#1201] / [Intel XE#2360])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#1192] / [Intel XE#1201]) -> [FAIL][562] ([Intel XE#1999])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#512]) -> [SKIP][564] ([Intel XE#1201] / [Intel XE#512])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@xe_mmap@small-bar.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][566] ([Intel XE#378])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@xe_module_load@force-load.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [FAIL][567] -> [FAIL][568] ([Intel XE#2136])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_module_load@many-reload.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_module_load@many-reload.html

  * igt@xe_oa@oa-formats:
    - shard-dg2-set2:     [SKIP][569] ([Intel XE#2419]) -> [SKIP][570] ([Intel XE#1201] / [Intel XE#2419])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@xe_oa@oa-formats.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@xe_oa@oa-formats.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][572] ([Intel XE#2419]) +3 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][574] ([Intel XE#979])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#1061] / [Intel XE#1201]) -> [FAIL][576] ([Intel XE#1173])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@xe_peer2peer@read.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#2284]) -> [SKIP][578] ([Intel XE#1201] / [Intel XE#2284])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][579] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][580] ([Intel XE#2284] / [Intel XE#366])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@xe_pm@d3cold-multiple-execs.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          [SKIP][581] ([Intel XE#1130]) -> [SKIP][582] ([Intel XE#2284] / [Intel XE#366])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@xe_pm@s4-d3cold-basic-exec.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_pm@s4-d3cold-basic-exec.html
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][584] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_pm@s4-d3cold-basic-exec.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][586] ([Intel XE#579])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][587] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][588] ([Intel XE#1130] / [Intel XE#1201])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@xe_query@multigpu-query-engines.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
    - shard-lnl:          [SKIP][589] ([Intel XE#944]) -> [SKIP][590] ([Intel XE#1130])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@xe_query@multigpu-query-engines.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][592] ([Intel XE#944])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][594] ([Intel XE#944])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html
    - shard-lnl:          [SKIP][595] ([Intel XE#1130]) -> [SKIP][596] ([Intel XE#944])
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@xe_query@multigpu-query-oa-units.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@xe_query@multigpu-query-oa-units.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_7951 -> IGTPW_11518

  IGTPW_11518: 11518
  IGT_7951: 7951
  xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a: abbcf7af3bd79f8729a6dba72674a81730f97f8a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/index.html

--===============3854433341578394136==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136449/">https://patchwork.freedesktop.org/series/136449/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7951_full -&gt; XEIGTPW_11518_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11518_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11518_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11518_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-5/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_vrr@flip-basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_rpm@modeset-non-lpsp-stress:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251">Intel XE#2251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-4/igt@kms_content_protection@legacy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@kms_content_protection@uevent.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-5/igt@kms_content_protection@uevent.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">WARN</a> +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-6/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-8/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@basic-get-property:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@xe_exec_queue_property@basic-get-property.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-7/igt@xe_module_load@many-reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@xe_module_load@many-reload.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-llseek-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-2/igt@xe_prime_self_import@basic-llseek-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-1/igt@xe_prime_self_import@basic-llseek-size.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-no-array-conflict:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@xe_vm@bind-no-array-conflict.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-7/igt@xe_vm@bind-no-array-conflict.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7951_full and XEIGTPW_11518_full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 12.94] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@bcs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vcs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.89] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11518_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-5/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic-force-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_psr@psr2-suspend@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@kms_psr@psr2-suspend@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_vblank@query-forked.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@xe_oa@oa-unit-exclusive-stream-exec-q.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_pm_residency@idle-residency-on-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-16777216:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@xe_vm@large-userptr-misaligned-binds-16777216.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_vm@large-userptr-misaligned-binds-16777216.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +63 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_atomic@atomic-invalid-params.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_atomic@atomic-invalid-params.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_lease@lease-unleased-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_lease@lease-unleased-crtc.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_pm_backlight@basic-brightness.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@xe_ccs@block-multicopy-inplace.html">PASS</a> +60 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-5/igt@xe_exec_balancer@many-cm-parallel-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-5/igt@xe_exec_balancer@many-cm-parallel-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-7/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> +83 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_exec_basic@no-exec-basic-defer-bind.html">PASS</a> +57 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-2/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_exec_compute_mode@once-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_exec_threads@threads-mixed-shared-vm-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@xe_pm@s2idle-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-bmg-4/igt@xe_pm@s4-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-bmg-4/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-get-prop-any:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_addfb_basic@invalid-get-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_addfb_basic@invalid-get-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-3/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-4/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-8/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-8/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-433/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_module_load@many-reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@xe_oa@oa-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-435/igt@xe_oa@oa-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-463/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-6/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-6/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7951/shard-lnl-3/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/shard-lnl-4/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7951 -&gt; IGTPW_11518</li>
</ul>
<p>IGTPW_11518: 11518<br />
  IGT_7951: 7951<br />
  xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a: abbcf7af3bd79f8729a6dba72674a81730f97f8a</p>

</body>
</html>

--===============3854433341578394136==--
