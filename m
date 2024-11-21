Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25B5D75BA7
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 03:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5228510E848;
	Thu, 21 Nov 2024 03:36:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5639210E83F;
 Thu, 21 Nov 2024 03:36:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Improvements_for_xe=5Fsrio?=
 =?utf-8?q?v=5Fflr_test_and_xe=5Fmmio_lib_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Nov 2024 03:36:28 -0000
Message-ID: <173216018836.963970.15366174984693744550@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120173749.348843-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241120173749.348843-1-marcin.bernatowicz@linux.intel.com>
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

== Series Details ==

Series: Improvements for xe_sriov_flr test and xe_mmio lib (rev2)
URL   : https://patchwork.freedesktop.org/series/141556/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8118_full -> XEIGTPW_12150_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12150_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12150_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12150_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          [PASS][4] -> [DMESG-WARN][5] +39 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][8] -> [DMESG-FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_module_load@many-reload.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-3/igt@xe_module_load@many-reload.html

  * igt@xe_vm@large-userptr-split-binds-8388608:
    - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_vm@large-userptr-split-binds-8388608.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@xe_vm@large-userptr-split-binds-8388608.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:
    - shard-lnl:          [DMESG-WARN][13] ([Intel XE#3466]) -> [DMESG-WARN][14] +2 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [INCOMPLETE][15] ([Intel XE#1195] / [Intel XE#3468]) -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-bmg:          [DMESG-WARN][17] ([Intel XE#3468]) -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_exec_reset@gt-reset-stress.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][19] ([Intel XE#2136]) -> [FAIL][20] +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@xe_module_load@reload-no-display.html

  
New tests
---------

  New tests have been introduced between XEIGT_8118_full and XEIGTPW_12150_full:

### New IGT tests (12) ###

  * igt@kms_color@deep-color@pipe-a-hdmi-a-3-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [22.70] s

  * igt@kms_color@deep-color@pipe-a-hdmi-a-3-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.67] s

  * igt@kms_color@deep-color@pipe-a-hdmi-a-3-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.75] s

  * igt@kms_color@deep-color@pipe-b-hdmi-a-3-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [22.64] s

  * igt@kms_color@deep-color@pipe-b-hdmi-a-3-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.67] s

  * igt@kms_color@deep-color@pipe-b-hdmi-a-3-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.71] s

  * igt@kms_color@deep-color@pipe-c-hdmi-a-3-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [22.65] s

  * igt@kms_color@deep-color@pipe-c-hdmi-a-3-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.69] s

  * igt@kms_color@deep-color@pipe-c-hdmi-a-3-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.75] s

  * igt@kms_color@deep-color@pipe-d-hdmi-a-3-ctm:
    - Statuses : 1 pass(s)
    - Exec time: [22.67] s

  * igt@kms_color@deep-color@pipe-d-hdmi-a-3-degamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.66] s

  * igt@kms_color@deep-color@pipe-d-hdmi-a-3-gamma:
    - Statuses : 1 pass(s)
    - Exec time: [22.74] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12150_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1885])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][22] -> [FAIL][23] ([Intel XE#3130] / [Intel XE#3249])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2134])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@fbdev@read.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          NOTRUN -> [FAIL][25] ([Intel XE#3126])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2550]) +23 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][27] -> [DMESG-WARN][28] ([Intel XE#3468]) +54 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-lnl:          [PASS][29] -> [DMESG-WARN][30] ([Intel XE#3514]) +4 other tests dmesg-warn
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_async_flips@test-time-stamp.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-7/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#1701]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#3279])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1407])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2327]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#2136] / [Intel XE#2351]) +10 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1124]) +7 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1124]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1124]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2314] / [Intel XE#2894])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#2191]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#367])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2314] / [Intel XE#2894])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#367]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2887]) +8 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2887]) +13 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#3433]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#787]) +125 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#455] / [Intel XE#787]) +20 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#373]) +8 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-8/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2325])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-4/igt@kms_chamelium_color@ctm-max.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#306])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2252]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#373]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#3278])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][59] ([Intel XE#1178])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#307])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][61] ([Intel XE#1178]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][62] ([Intel XE#1188])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][63] ([Intel XE#3468]) +15 other tests dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#308])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2320]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1424]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2321])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][68] ([Intel XE#3466]) +2 other tests dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2291])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2291])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#309]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][73] -> [DMESG-WARN][74] ([Intel XE#877])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][75] ([Intel XE#877])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1508])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#1340]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([i915#3804])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#3070])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#2244])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2244])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1138])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-3/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1138])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#2316]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][86] -> [FAIL][87] ([Intel XE#3486])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][88] -> [FAIL][89] ([Intel XE#301])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][90] -> [FAIL][91] ([Intel XE#2882]) +2 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1421]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2316])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@absolute-wf_vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][94] ([Intel XE#3468]) +1 other test dmesg-fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-3/igt@kms_flip@absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][95] -> [FAIL][96] ([Intel XE#886]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#455]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1397] / [Intel XE#1745])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1397])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2380]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2136]) +31 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1401]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2293]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#651]) +7 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2311]) +15 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][108] -> [SKIP][109] ([Intel XE#2136]) +34 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][110] ([Intel XE#2333]) +7 other tests fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2312]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#651]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#656]) +20 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#658])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2352])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2313]) +14 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#653]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1503])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2423] / [i915#2575]) +29 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][120] ([Intel XE#361])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2-set2:     [PASS][122] -> [SKIP][123] ([Intel XE#2423] / [i915#2575]) +103 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2763]) +11 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2763]) +9 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-lnl:          [PASS][126] -> [DMESG-WARN][127] ([Intel XE#2566] / [Intel XE#3466])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-lnl:          [PASS][128] -> [DMESG-WARN][129] ([Intel XE#3466]) +29 other tests dmesg-warn
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2763]) +5 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1439] / [Intel XE#3141])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][132] -> [SKIP][133] ([Intel XE#2446]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#2893]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1489]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#1489]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2387]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1128])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1406]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-6/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-4/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#3414]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#3414]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-3/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2330])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vblank@wait-idle-hang@pipe-a-dp-2:
    - shard-bmg:          [PASS][146] -> [DMESG-FAIL][147] ([Intel XE#3468]) +12 other tests dmesg-fail
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_vblank@wait-idle-hang@pipe-a-dp-2.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-4/igt@kms_vblank@wait-idle-hang@pipe-a-dp-2.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#1499])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-8/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#756])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-6/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#756])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][151] -> [SKIP][152] ([Intel XE#2423]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@testdisplay.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@testdisplay.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#2905]) +5 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-6/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2905]) +6 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@resume-one:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#2905])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@xe_eudebug_online@resume-one.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][156] ([Intel XE#1473])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#688]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2322]) +8 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#1392]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-2/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#1130]) +63 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_exec_basic@no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#288]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_reset@cm-close-execqueues-close-fd:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][162] ([Intel XE#3514]) +1 other test dmesg-warn
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-7/igt@xe_exec_reset@cm-close-execqueues-close-fd.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][163] ([Intel XE#3371])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-4/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][164] ([Intel XE#3467] / [Intel XE#3468])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][165] -> [DMESG-WARN][166] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [PASS][167] -> [SKIP][168] ([Intel XE#2229]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [PASS][169] -> [SKIP][170] ([Intel XE#1192])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_live_ktest@xe_migrate.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-3/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2457])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@xe_module_load@force-load.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#378])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_module_load@force-load.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2248])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][174] ([Intel XE#1173])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#2284] / [Intel XE#366])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-6/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#2284] / [Intel XE#366])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#2284])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [PASS][178] -> [DMESG-WARN][179] ([Intel XE#3468])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_pm@s2idle-mocs.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-bmg:          [PASS][180] -> [DMESG-WARN][181] ([Intel XE#3468] / [Intel XE#569])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_pm@s3-basic-exec.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][182] -> [ABORT][183] ([Intel XE#1358] / [Intel XE#1607]) +1 other test abort
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#584])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-3/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#944])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#944]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][187] -> [SKIP][188] ([Intel XE#1130]) +178 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_vm@large-split-binds-536870912.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][189] ([Intel XE#2919])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     NOTRUN -> [ABORT][190] ([Intel XE#3421])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [DMESG-WARN][191] ([Intel XE#3521]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@core_hotunplug@hotreplug.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-4/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1885]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_hotunplug@unbind-rebind.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@core_hotunplug@unbind-rebind.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#3453]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [FAIL][197] ([Intel XE#3339]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][199] ([Intel XE#911]) -> [PASS][200] +3 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2423] / [i915#2575]) -> [PASS][202] +86 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [INCOMPLETE][203] ([Intel XE#2613]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [DMESG-FAIL][205] ([Intel XE#3468]) -> [PASS][206] +26 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          [INCOMPLETE][207] ([Intel XE#3466]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][209] ([Intel XE#2705]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [INCOMPLETE][211] ([Intel XE#1195] / [Intel XE#3226]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [FAIL][213] ([Intel XE#1475]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-dp-2:
    - shard-bmg:          [DMESG-WARN][215] -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_dirtyfb@default-dirtyfb-ioctl@a-dp-2.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_dirtyfb@default-dirtyfb-ioctl@a-dp-2.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2423]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_dp_aux_dev.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][219] ([Intel XE#2882]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][221] ([Intel XE#3321] / [Intel XE#3486]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][223] ([Intel XE#301]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][225] ([Intel XE#2597]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [DMESG-WARN][227] ([Intel XE#3468]) -> [PASS][228] +115 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-FAIL][229] ([Intel XE#1727]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][231] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@flip-vs-panning-interruptible.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@c-edp1:
    - shard-lnl:          [FAIL][233] ([Intel XE#886]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@c-edp1.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2136]) -> [PASS][236] +23 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][237] ([Intel XE#1195] / [Intel XE#3468]) -> [PASS][238] +1 other test pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][240] +12 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][241] ([Intel XE#1503]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [DMESG-WARN][243] ([Intel XE#3466]) -> [PASS][244] +37 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_plane_cursor@primary.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-1/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][245] ([Intel XE#2566]) -> [PASS][246] +1 other test pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][247] ([Intel XE#718]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][249] ([Intel XE#2029]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [ABORT][251] ([Intel XE#3468]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [INCOMPLETE][253] ([Intel XE#2864]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2446]) -> [PASS][256] +3 other tests pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [FAIL][257] ([Intel XE#3536]) -> [PASS][258] +1 other test pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_psr@psr2-sprite-render.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-1/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][259] ([Intel XE#2883]) -> [PASS][260] +2 other tests pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [INCOMPLETE][261] ([Intel XE#1727]) -> [PASS][262] +3 other tests pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_vblank@query-busy.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-8/igt@kms_vblank@query-busy.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [INCOMPLETE][263] -> [PASS][264] +2 other tests pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_vrr@negative-basic.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@twice-userptr:
    - shard-dg2-set2:     [DMESG-WARN][265] ([Intel XE#1727]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_exec_basic@twice-userptr.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@xe_exec_basic@twice-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-lnl:          [DMESG-FAIL][267] ([Intel XE#3466]) -> [PASS][268] +5 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][269] ([Intel XE#3371]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][271] ([Intel XE#3467]) -> [PASS][272] +3 other tests pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][273] ([Intel XE#2961] / [Intel XE#3191]) -> [PASS][274] +1 other test pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_live_ktest@xe_bo.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][275] ([Intel XE#2998]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [DMESG-WARN][277] ([Intel XE#569]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [DMESG-FAIL][279] ([Intel XE#1727]) -> [PASS][280] +1 other test pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
    - shard-bmg:          [DMESG-WARN][281] ([Intel XE#1727]) -> [PASS][282] +9 other tests pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-3/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1130]) -> [PASS][284] +173 other tests pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [DMESG-WARN][285] ([Intel XE#3521]) -> [SKIP][286] ([Intel XE#1885])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2423] / [i915#2575]) -> [SKIP][288] ([Intel XE#873])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#316]) -> [SKIP][290] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [FAIL][291] ([Intel XE#3162]) -> [INCOMPLETE][292] ([Intel XE#3466])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][294] ([Intel XE#316]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2136]) -> [SKIP][296] ([Intel XE#316]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-lnl:          [DMESG-WARN][297] ([Intel XE#1725]) -> [INCOMPLETE][298] ([Intel XE#3225] / [Intel XE#3466])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#316]) -> [SKIP][300] ([Intel XE#2136]) +2 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][302] ([Intel XE#607])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][304] ([Intel XE#1124]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#1124]) -> [SKIP][306] ([Intel XE#2136]) +14 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#1124]) -> [SKIP][308] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2136]) -> [SKIP][310] ([Intel XE#1124]) +8 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#367]) -> [SKIP][312] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2423] / [i915#2575]) -> [SKIP][314] ([Intel XE#2191]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2191]) -> [SKIP][316] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2423] / [i915#2575]) -> [SKIP][318] ([Intel XE#367]) +2 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][320] ([Intel XE#2136]) +11 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2907]) -> [SKIP][322] ([Intel XE#2136])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][324] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#3442]) -> [SKIP][326] ([Intel XE#2136])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2136]) -> [SKIP][328] ([Intel XE#2907]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][330] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2136]) -> [SKIP][332] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#306]) -> [SKIP][334] ([Intel XE#2423] / [i915#2575])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#373]) +13 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#373]) -> [SKIP][338] ([Intel XE#2423] / [i915#2575]) +16 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@invalid-degamma-lut-sizes:
    - shard-dg2-set2:     [DMESG-WARN][339] ([Intel XE#1727]) -> [SKIP][340] ([Intel XE#2423] / [i915#2575])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_color@invalid-degamma-lut-sizes.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_color@invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2423] / [i915#2575]) -> [FAIL][342] ([Intel XE#1178])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_content_protection@atomic.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [FAIL][343] ([Intel XE#1178]) -> [INCOMPLETE][344] ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2423] / [i915#2575]) -> [FAIL][346] ([Intel XE#1188])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_content_protection@uevent.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#308]) -> [SKIP][348] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2423] / [i915#2575]) -> [SKIP][350] ([Intel XE#308]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#323]) -> [SKIP][352] ([Intel XE#2423] / [i915#2575])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#2423] / [i915#2575]) -> [SKIP][354] ([Intel XE#323])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#455]) -> [SKIP][356] ([Intel XE#2351])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_dsc@dsc-basic.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#455]) -> [SKIP][358] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#776]) -> [SKIP][360] ([Intel XE#2136])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_fbcon_fbt@psr.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2423] / [i915#2575]) -> [SKIP][362] ([Intel XE#701])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#1135]) -> [SKIP][364] ([Intel XE#2423] / [i915#2575])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_feature_discovery@psr2.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][365] ([Intel XE#301]) -> [SKIP][366] ([Intel XE#2423] / [i915#2575])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][367] ([Intel XE#1727]) -> [FAIL][368] ([Intel XE#301])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][369] ([Intel XE#3487]) -> [FAIL][370] ([Intel XE#3321] / [Intel XE#3487])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [FAIL][371] ([Intel XE#301] / [Intel XE#3487]) -> [FAIL][372] ([Intel XE#301] / [Intel XE#3321] / [Intel XE#3487]) +1 other test fail
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [FAIL][373] ([Intel XE#3149] / [Intel XE#886]) -> [FAIL][374] ([Intel XE#886])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#2136]) -> [SKIP][376] ([Intel XE#455]) +3 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][378] ([Intel XE#455])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#455]) -> [SKIP][380] ([Intel XE#2136]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][381] ([i915#5274]) -> [SKIP][382] ([Intel XE#2423] / [i915#2575])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#651]) -> [SKIP][384] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][385] ([Intel XE#2311]) -> [SKIP][386] ([Intel XE#2312]) +10 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][388] ([Intel XE#651]) +12 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          [FAIL][389] ([Intel XE#2333]) -> [DMESG-FAIL][390] ([Intel XE#3468]) +5 other tests dmesg-fail
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-dg2-set2:     [INCOMPLETE][391] ([Intel XE#1195]) -> [SKIP][392] ([Intel XE#2136])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
    - shard-bmg:          [INCOMPLETE][393] ([Intel XE#3468]) -> [FAIL][394] ([Intel XE#2333])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [DMESG-FAIL][395] ([Intel XE#3468]) -> [FAIL][396] ([Intel XE#2333]) +5 other tests fail
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [DMESG-FAIL][397] ([Intel XE#3468]) -> [SKIP][398] ([Intel XE#2312]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [DMESG-FAIL][399] ([Intel XE#3468]) -> [INCOMPLETE][400] ([Intel XE#2050])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][401] ([Intel XE#2333]) -> [SKIP][402] ([Intel XE#2312]) +5 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#658]) -> [SKIP][404] ([Intel XE#2136] / [Intel XE#2351])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#651]) -> [SKIP][406] ([Intel XE#2136]) +28 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2136]) -> [SKIP][408] ([Intel XE#651]) +24 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#2136]) -> [SKIP][410] ([Intel XE#653]) +31 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][411] ([Intel XE#2313]) -> [SKIP][412] ([Intel XE#2312]) +13 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][414] ([Intel XE#653]) +10 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2136]) -> [SKIP][416] ([Intel XE#1158])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#653]) -> [SKIP][418] ([Intel XE#2136]) +32 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#653]) -> [SKIP][420] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2136]) -> [SKIP][422] ([Intel XE#346]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#2925]) -> [SKIP][424] ([Intel XE#2136])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#2136]) -> [SKIP][426] ([Intel XE#2927])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2423] / [i915#2575]) -> [FAIL][428] ([Intel XE#361])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2423] / [i915#2575]) -> [SKIP][430] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][432] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2938]) -> [SKIP][434] ([Intel XE#2136])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][436] ([Intel XE#1122])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#3309]) -> [SKIP][438] ([Intel XE#2136])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][440] ([Intel XE#1129])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2136]) -> [SKIP][442] ([Intel XE#908])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [ABORT][443] ([Intel XE#3468]) -> [SKIP][444] ([Intel XE#2446]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [DMESG-WARN][445] ([Intel XE#2042]) -> [SKIP][446] ([Intel XE#2446])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1489]) -> [SKIP][448] ([Intel XE#2136]) +5 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#2136]) -> [SKIP][450] ([Intel XE#1489]) +2 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#2136]) -> [SKIP][452] ([Intel XE#1122])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1122]) -> [SKIP][454] ([Intel XE#2136])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][456] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][458] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_psr@pr-dpms.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#2351]) -> [SKIP][460] ([Intel XE#2850] / [Intel XE#929])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@psr-cursor-plane-move.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][462] ([Intel XE#2351]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_psr@psr-primary-page-flip.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#2136]) -> [SKIP][464] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@psr2-basic.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_psr@psr2-basic.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][466] ([Intel XE#2136]) +13 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_psr@psr2-sprite-plane-move.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][468] ([Intel XE#2939])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#3414]) -> [SKIP][470] ([Intel XE#2423] / [i915#2575])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#2423] / [i915#2575]) -> [SKIP][472] ([Intel XE#1127])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1127]) -> [SKIP][474] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#2423] / [i915#2575]) -> [SKIP][476] ([Intel XE#3414]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2423] / [i915#2575]) -> [SKIP][478] ([Intel XE#330])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#455]) -> [SKIP][480] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_vrr@flip-dpms.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#2423] / [i915#2575]) -> [SKIP][482] ([Intel XE#455]) +10 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_vrr@flipline.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#2423] / [i915#2575]) -> [SKIP][484] ([Intel XE#2168])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_vrr@lobf.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#2423] / [i915#2575]) -> [SKIP][486] ([Intel XE#756])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#756]) -> [SKIP][488] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][490] ([Intel XE#1130]) +1 other test skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#1130]) -> [SKIP][492] ([Intel XE#1123])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#1126]) -> [SKIP][494] ([Intel XE#1130]) +1 other test skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#2905]) -> [SKIP][496] ([Intel XE#1130]) +13 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#1130]) -> [SKIP][498] ([Intel XE#2905]) +11 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_eudebug_online@reset-with-attention.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1130]) -> [FAIL][500] ([Intel XE#1600])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [INCOMPLETE][501] ([Intel XE#1195]) -> [SKIP][502] ([Intel XE#1130])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#288]) -> [SKIP][504] ([Intel XE#1130]) +31 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#1130]) -> [SKIP][506] ([Intel XE#288]) +29 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#2360]) -> [SKIP][508] ([Intel XE#1130])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     [DMESG-WARN][509] ([Intel XE#3467]) -> [SKIP][510] ([Intel XE#1130]) +2 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-dg2-set2:     [DMESG-WARN][511] ([Intel XE#3343]) -> [SKIP][512] ([Intel XE#1130]) +1 other test skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#1130]) -> [DMESG-WARN][514] ([Intel XE#3343])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-bmg:          [DMESG-WARN][515] ([Intel XE#3467]) -> [DMESG-WARN][516] ([Intel XE#3467] / [Intel XE#3468])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [FAIL][517] ([Intel XE#3499]) -> [DMESG-FAIL][518] ([Intel XE#3467]) +1 other test dmesg-fail
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-lnl:          [FAIL][519] ([Intel XE#3499]) -> [FAIL][520] ([Intel XE#3499] / [Intel XE#3539]) +3 other tests fail
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-lnl-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
    - shard-bmg:          [FAIL][521] ([Intel XE#3499]) -> [DMESG-FAIL][522] ([Intel XE#3467] / [Intel XE#3468])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#1130]) -> [DMESG-WARN][524] ([Intel XE#3467]) +2 other tests dmesg-warn
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [DMESG-FAIL][525] ([Intel XE#3467]) -> [FAIL][526] ([Intel XE#3499] / [Intel XE#3539]) +1 other test fail
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#2541]) -> [SKIP][528] ([Intel XE#1130]) +9 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1130]) -> [SKIP][530] ([Intel XE#2541]) +10 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_oa@polling-small-buf.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1130]) -> [SKIP][532] ([Intel XE#2839] / [Intel XE#977])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-436/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#1130]) -> [SKIP][534] ([Intel XE#2838] / [Intel XE#979])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#1061]) -> [FAIL][536] ([Intel XE#1173])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_peer2peer@read.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][537] ([Intel XE#1173]) -> [SKIP][538] ([Intel XE#1061])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_peer2peer@write.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#1130]) -> [SKIP][540] ([Intel XE#2284] / [Intel XE#366])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#2284]) -> [SKIP][542] ([Intel XE#1130])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_pm@d3cold-mocs.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][543] ([Intel XE#569]) -> [DMESG-WARN][544] ([Intel XE#3468] / [Intel XE#569])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][546] ([Intel XE#1130])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][547] ([Intel XE#569]) -> [SKIP][548] ([Intel XE#1130])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#1130]) -> [DMESG-WARN][550] ([Intel XE#3468] / [Intel XE#569])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#1130]) -> [SKIP][552] ([Intel XE#944]) +1 other test skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#944]) -> [SKIP][554] ([Intel XE#1130]) +2 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#3342]) -> [SKIP][556] ([Intel XE#1130])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer:
    - shard-dg2-set2:     [DMESG-WARN][557] ([Intel XE#1727]) -> [SKIP][558] ([Intel XE#1130]) +3 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-434/igt@xe_vm@munmap-style-unbind-either-side-partial-split-page-hammer.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][559] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][560] ([Intel XE#1130])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3126
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3162
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514
  [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
  [Intel XE#3536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3536
  [Intel XE#3539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3539
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8118 -> IGTPW_12150
  * Linux: xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd -> xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99

  IGTPW_12150: 12150
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd
  xe-2256-0cb17ecec562c61d45997a2fced4e5ed99b31f99: 0cb17ecec562c61d45997a2fced4e5ed99b31f99

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12150/index.html
